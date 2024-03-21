# My NixOS config!

My very first NixOS config, I like to keep it simple.

# Building

Run this on your first time:

```bash
git clone https://github.com/rice-cracker-dev/nixos-config ~/nixos && cd ~/nixos
sudo nixos-rebuild --flake ./#nixos # or . if your user is "nixos"
```

This config provides aliases to make rebuilding NixOS simpler:
`nixos-rebuild-flake <config-directory>#default`
`nixos-update-flake <config-directory>#default`

# Kudos to these folks

- [@vimjoyer](https://www.youtube.com/@vimjoyer) - For your amazing NixOS tutorials.
- [Hyprland](https://hyprland.org) - For providing an amazing Wayland window manager.
