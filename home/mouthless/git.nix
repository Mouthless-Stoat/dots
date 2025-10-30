{ ... }:
{
  # git config
  programs.git = {
    enable = true;
    settings = {
      aliases = {
        co = "checkout";
        st = "status";
      };
      user = {
        name = "Mouthless-Stoat";
        email = "nphuyanh@outlook.com";
      };
    };
    extraConfig = {
      init.defaultBranch = "main";
      credential.helper = "manager";
      credential.credentialStore = "plaintext";
    };
  };
  programs.lazygit.enable = true;
}
