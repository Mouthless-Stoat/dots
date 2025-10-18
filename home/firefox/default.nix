{ ... }:
{
  programs.firefox = {
    enable = true;
    profiles.personal = {
      isDefault = true;
      extensions.force = true;
    };
  };
}
