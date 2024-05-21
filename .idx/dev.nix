# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs, ... }: {
  channel = "stable-23.11";
  packages = [];
  env = {
    DENO_INSTALL = "/home/user/.deno";
  };
  idx = {
    extensions = [
      "denoland.vscode-deno"
    ];
    previews = {
      enable = true;
      previews = {
      };
    };
    workspace = {
      onCreate = {
      };
      onStart = {
      };
    };
  };
}
