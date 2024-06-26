# templates

### common commands

**List available templates**
```sh
nix flake show 'github:jacbart/templates'
```

**Update local version** - the `init` command won't auto update the templates
```sh
nix flake update 'github:jacbart/templates'
```

## List of project templates

### [default](./minimal/flake.nix)

minimal flake managed project

```sh
nix flake init -t 'github:jacbart/templates'
```

### [rust](./rust/flake.nix)

minimal flake for a rust project

```sh
nix flake init -t 'github:jacbart/templates#rust'
rg 'BIN_NAME' {Cargo.toml,flake.nix,.gitignore} # lists where to replace BIN_NAME with your binary name
```

### [go](./go/flake.nix)

minimal flake for a golang project

```sh
nix flake init -t 'github:jacbart/templates#go'
```