{ profile, ... }:
{
  users.users.${profile.username}.openssh.authorizedKeys.keys = profile.sshAuthorizedKeys or [ ];
}
