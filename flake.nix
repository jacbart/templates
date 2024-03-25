{
  description = "collection of project templates";

  outputs = {...}: {
    templates = {
      rust = {
        path = ./rust;
        description = "Rust project template";
      };
      go = {
        path = ./go;
        description = "Go project template";
      };
    };
  };
}