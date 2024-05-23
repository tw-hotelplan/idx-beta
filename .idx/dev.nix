# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs, ... }: {
  channel = "stable-23.11";
  packages = [];
  env = {
    DENO_INSTALL = "/home/user/flutter";
  };
  idx = {
    extensions = [
      "denoland.vscode-deno"
    ];
    previews = {
      enable = true;
      previews = {
        web = {
          command = ["deno" "run" "-A" "hello-world.ts"];
          env = {
            PORT = "$PORT";
          };
          manager = "web";
        };
      };
    };
    workspace = {
      onCreate = {
        deno-install = "curl -fsSL https://deno.land/install.sh | sh";
      };
      onStart = {
      };
    };
  };
}
