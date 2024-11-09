{
  description = "collection of project templates";

  outputs = { self, ... }: {
    templates = {
      minimal = {
        path = ./minimal;
        description = "minimal flake project";
        welcomeText = ''
          # Welcome to the minimal project template!

          This template is a simple starting point for a new flake managed projects. It includes a .gitignore and a .envrc file to enable flake with direnv.

          >Add build inputs or shell hooks to the flake.nix file to customize the devShell.
        '';
      };
      rust = {
        path = ./rust;
        description = "flake managed rust project";
        welcomeText = ''
          # Welcome to the Rust project template!

          This template is a simple starting point for a new Rust flake project. Replace `BIN_NAME` with the name of your binary in the Cargo.toml file and the main.rs file.

          >For more information about Rust and Cargo, check out the official documentation at https://doc.rust-lang.org/cargo/.
        '';
      };
      go = {
        path = ./go;
        description = "flake managed golang project";
        welcomeText = ''
          # Welcome to the Golang project template!

          This template is a simple starting point for a new Nix Go project. To setup the go project run the below command

          ```sh
          go mod init github.com/username/projectname
          ```
          >Edit the `flake.nix` file to rename the binary, add dependencies and build instructions.
        '';
      };
      # sf = {
      #   path = ./sfdx;
      #   description = "Salesforce develement environment managed by a flake";
      #   welcomeText = ''
      #     # Welcome to the Salesforce dev environment!

      #     This template is provides a nix package for the sf cli, refer to salesforce's docs for project setup
      #     https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference_project_commands_unified.htm#cli_reference_project_generate_unified
      #   '';
      # };
    };
    templates.default = self.templates.minimal;
  };
}
