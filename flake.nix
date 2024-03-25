{
  description = "collection of project templates";

  outputs = {...}: {
    templates = {
      rust = {
        path = ./rust;
        description = "Rust project template";
        welcomeText = ''
          # Welcome to the Rust project template!

          This template is a simple starting point for a new Rust project. It includes a Cargo.toml file with some common dependencies and a simple main.rs file that prints "Hello, world!".
          To build and run the project, use the following commands:
          ```sh
          cargo build
          cargo run
          ```
          You can also run the tests with:
          ```sh
          cargo test
          ```
          For more information about Rust and Cargo, check out the official documentation at https://doc.rust-lang.org/cargo/.
        '';
      };
      go = {
        path = ./go;
        description = "Go project template";
        welcomeText = ''
          # Welcome to the Go project template!

          This template is a simple starting point for a new Nix Go project. To set go run the below command
          ```sh
          go mod init github.com/jacbart/projectname
          ```
        '';
      };
    };
  };
}