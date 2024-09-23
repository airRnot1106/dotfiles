{ pkgs, ... }:
{
  home.packages = [
    (pkgs.stdenv.mkDerivation {
      name = "era";
      src =
        if pkgs.system == "x86_64-linux" then
          builtins.fetchTarball {
            url = "https://github.com/airRnot1106/era/releases/download/v0.1.3/era-v0.1.3-x86_64-linux.tar.gz";
            sha256 = "0inf53m863vavvh6fg4dqys0sffrignsq426ybv3sfdfyi9g75jd";
          }
        else if pkgs.system == "aarch64-linux" then
          builtins.fetchTarball {
            url = "https://github.com/airRnot1106/era/releases/download/v0.1.3/era-v0.1.3-aarch64-linux.tar.gz";
            sha256 = "0c894f0z83cds9pk4jxr4rryck9nfb67gy3v9c2x1q0mx0psbcx5";
          }
        else if pkgs.system == "x86_64-darwin" then
          builtins.fetchTarball {
            url = "https://github.com/airRnot1106/era/releases/download/v0.1.3/era-v0.1.3-x86_64-darwin.tar.gz";
            sha256 = "1g5jxlzpl955730p8b5gqrzvdnk92nfyn3fqwhyissh00iysqdiq";
          }
        else if pkgs.system == "aarch64-darwin" then
          builtins.fetchTarball {
            url = "https://github.com/airRnot1106/era/releases/download/v0.1.3/era-v0.1.3-aarch64-darwin.tar.gz";
            sha256 = "165p4qp20q6wy19fxa40w2108xa45ri3g1h9jwrhqrd29vmbxvh4";
          }
        else
          throw "not supported system";
      phases = [ "installPhase" ];
      installPhase = ''
        mkdir -p $out/bin
        cp $src/era $out/bin/era
        chmod +x $out/bin/era
      '';
    })
  ];
}
