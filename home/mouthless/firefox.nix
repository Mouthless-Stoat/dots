{ ... }:
{
  programs.firefox = {
    enable = true;
    profiles.personal = {
      isDefault = true;
      extensions.force = true;
      settings = {
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "extensions.pocket.enabled" = false;
      };
      userChrome = "
        /* userChrome.css */
        :root {
            min-width: 1rem !important;
        }
      ";
    };
  };
}
