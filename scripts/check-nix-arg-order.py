#!/usr/bin/env python3
"""Check that Nix module function arguments follow the project convention.

Canonical order (present args only; missing ones are skipped):
  self -> inputs -> lib -> pkgs -> config -> options -> profile -> common -> modules

Known names above must appear in this order; any unknown arg must come after
all known ones (unknowns keep their own relative order). Files whose first
syntactic element is not a `{ ... }:` function header are skipped.
"""
import re
import sys

ORDER = ["self", "inputs", "lib", "pkgs", "config", "options", "profile", "common", "modules"]
RANK = {n: i for i, n in enumerate(ORDER)}
IDENT = re.compile(r"[A-Za-z_][A-Za-z0-9_'-]*")


def strip_comments(s):
    out = []
    i, n = 0, len(s)
    while i < n:
        if s[i] == "#":
            while i < n and s[i] != "\n":
                i += 1
        elif s.startswith("/*", i):
            j = s.find("*/", i + 2)
            i = n if j < 0 else j + 2
        else:
            out.append(s[i])
            i += 1
    return "".join(out)


def skip_ws(text, i):
    n = len(text)
    while i < n:
        c = text[i]
        if c in " \t\r\n":
            i += 1
        elif c == "#":
            while i < n and text[i] != "\n":
                i += 1
        elif text.startswith("/*", i):
            j = text.find("*/", i + 2)
            i = n if j < 0 else j + 2
        else:
            break
    return i


def header_args(text):
    """Return list of top-level arg names if `text` starts with `{ ... }:`, else None."""
    n = len(text)
    i = skip_ws(text, 0)
    if i >= n or text[i] != "{":
        return None
    depth = 0
    j = i
    start = i + 1
    while j < n:
        c = text[j]
        if c == "#":
            while j < n and text[j] != "\n":
                j += 1
            continue
        if text.startswith("/*", j):
            k = text.find("*/", j + 2)
            j = n if k < 0 else k + 2
            continue
        if c in "{[(":
            depth += 1
        elif c in ")]}":
            depth -= 1
            if depth == 0 and c == "}":
                content = text[start:j]
                k = skip_ws(text, j + 1)
                if k < n and text[k] == "@":
                    k = skip_ws(text, k + 1)
                    while k < n and IDENT.match(text[k]):
                        k += 1
                    k = skip_ws(text, k)
                if k < n and text[k] == ":":
                    return split_args(content)
                return None
        j += 1
    return None


def split_args(content):
    content = strip_comments(content)
    names, depth, buf = [], 0, ""
    for c in content:
        if c in "{[(":
            depth += 1
            buf += c
        elif c in ")]}":
            depth -= 1
            buf += c
        elif c == "," and depth == 0:
            names.append(buf)
            buf = ""
        else:
            buf += c
    names.append(buf)
    out = []
    for part in names:
        part = part.strip()
        if not part or part.startswith("..."):
            continue
        m = IDENT.match(part)
        if m:
            out.append(m.group(0))
    return out


def check(path):
    try:
        with open(path, encoding="utf-8") as f:
            text = f.read()
    except OSError:
        return None
    args = header_args(text)
    if not args:
        return None
    # Known args are ranked by ORDER; unknown args share the highest rank so
    # they must all come after the known ones (their mutual order is free).
    unknown_rank = len(ORDER)
    ranks = [RANK.get(a, unknown_rank) for a in args]
    if ranks != sorted(ranks):
        known = [a for a in args if a in RANK]
        unknown = [a for a in args if a not in RANK]
        expected = [o for o in ORDER if o in known] + unknown
        return f"{path}: found {args}, expected {expected}"
    return None


def main():
    errs = [e for p in sys.argv[1:] if (e := check(p))]
    if errs:
        sys.stderr.write("Nix module argument order violations:\n")
        for e in errs:
            sys.stderr.write(f"  {e}\n")
        sys.stderr.write("\nCanonical order: " + " -> ".join(ORDER) + "\n")
        sys.exit(1)


if __name__ == "__main__":
    main()
