{
  self,
  lib,
  profile,
  ...
}:
{
  system = {
    stateVersion = 7;
    configurationRevision = self.rev or self.dirtyRev or null;
    primaryUser = lib.mkDefault profile.username;
    defaults.SoftwareUpdate.AutomaticallyInstallMacOSUpdates = lib.mkDefault false;
    activationScripts.extraActivation.text = lib.mkDefault ''
      # Set StartupMute to disable boot chime
      nvram StartupMute=%01
    '';
  };
}
