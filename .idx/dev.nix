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
        disable-extensions = ''
          cat <<< \
          $( \
            jq \
            '. += [{"identifier":{"id":"vscode.typescript-language-features"},"displayName":"TypeScript and JavaScript Language Features","disabled":true}]' \
            /home/user/.codeoss-cloudworkstations/extensions/extensions.json \
          ) \
          > /home/user/.codeoss-cloudworkstations/extensions/extensions.json'';
        modify-settings = ''
          cat <<< \
          $( \
            jq \
            '. += {"cloudDeveloperEnvironments.displayOpenVsxNotification": false}' \
            /home/user/.codeoss-cloudworkstations/data/Machine/settings.json \
          ) \
          > /home/user/.codeoss-cloudworkstations/data/Machine/settings.json'';
      };
      onStart = {
      };
    };
  };
}
