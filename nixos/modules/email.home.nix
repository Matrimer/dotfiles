{ pkgs, ... }:
{
  programs.astroid = {
    enable = true;
    extraConfig = {
    };
    externalEditor = "kitty vim";

  };
  programs.mbsync.enable = true;
  programs.msmtp.enable = true;
  programs.notmuch = {
    enable = true;
    hooks = {
      preNew = "mbsync --all";
    };
  };
  accounts.email = {
    accounts.mailbox = {
      address = "mats.rimereit@mailbox.org";
      gpg = {
        #key = "";
        #signByDefault = true;
      };
      imap.host = "imap.mailbox.org";
      mbsync = {
        enable = true;
        create = "maildir";
      };
      msmtp.enable = true;
      notmuch.enable = true;
      primary = true;
      realName = "Mats Rimereit";
      signature = {
        text = ''
          Best Regards,
          Mats Rimereit
        '';
      showSignature = "append";
      };
      passwordCommand = "rbw get mailbox.org";
      smtp = {
        host = "smtp.mailbox.org";
      };
      userName = "mats.rimereit@mailbox.org";
    };
  };
}

