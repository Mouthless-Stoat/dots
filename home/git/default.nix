{ ... }:
{
  # git config
  programs.git = {
    enable = true;
    aliases = {
      co = "checkout";
      st = "status";
    };
    userName = "Mouthless-Stoat";
    userEmail = "nphuyanh@outlook.com";
    extraConfig = {
      init.defaultBranch = "main";
      credential.helper = "manager";
      credential.credentialStore = "plaintext";
    };
  };
  programs.lazygit.enable = true;
}
