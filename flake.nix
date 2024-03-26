{
  description = "collection of project templates";

  outputs = { self, ... }: {
    templates = {
      minimal = { 
        path = ./minimal;
        description = "minimal flake project";
        welcomeText = ''
          # Welcome to the minimal project template!

          This template is a simple starting point for a new flake managed projects. It includes a README.md, gitignore and a envrc to enable flake using direnv.

          >Add build inputs or shell hooks to the flake.nix file to customize the devShell.  
        '';
      };
      rust = {
        path = ./rust;
        description = "flake managed rust project";
        welcomeText = ''
          # Welcome to the Rust project template!

          This template is a simple starting point for a new Rust project. It includes a Cargo.toml file with some common dependencies and a simple main.rs file that prints "Hello, world!".
          Replace `BIN_NAME` with the name of your binary in the Cargo.toml file and the main.rs file.  

          ```sh  
          rg 'BIN_NAME' {Cargo.toml,flake.nix,.gitignore}
          ```  
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
    };
    templates.default = self.templates.minimal;
  };
}