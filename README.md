# templates

### common commands

**List available templates**

```sh
nix flake show 'github:jacbart/templates'
```

**Update local version** - the `init` command won't auto update the templates

```sh
nix flake update --flake 'github:jacbart/templates'
# or
nix flake update 'github:jacbart/templates'
```

## List of project templates

### [default](./minimal/flake.nix)

minimal flake managed project

```sh
nix flake init -t 'github:jacbart/templates'
```

selecting another minimal flake, but for rust project

```sh
nix flake init -t 'github:jacbart/templates#rust'
```
