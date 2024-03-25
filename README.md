# templates

>inspired by https://github.com/akirak/flake-templates

## List of templates

### [rust](./rust/flake.nix)

minimal flake for a rust project

```sh
nix flake init -t 'github:jacbart/templates#rust'
rg 'BIN_NAME' {Cargo.toml,flake.nix,.gitignore} # lists where to replace BIN_NAME with your binary name
```

### ~~[go](./go/flake.nix)~~

minimal flake for a go project

```sh
nix flake init -t 'github:jacbart/templates#go'
```