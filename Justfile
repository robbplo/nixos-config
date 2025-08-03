build-cmd := if arch() == "aarch64" { "rebuild-mac" } else { "rebuild-linux" }

rebuild:
  just {{build-cmd}}

rebuild-mac:
  sudo darwin-rebuild switch --flake .

rebuild-linux:
  sudo nixos-rebuild switch --flake . --fast

up:
  nix flake update

# Update specific input
# usage: make upp i=home-manager
upp:
  nix flake update $(i)

history:
  nix profile history --profile /nix/var/nix/profiles/system

repl:
  nix repl -f flake:nixpkgs

clean:
  # remove all generations older than 7 days
  sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d

gc:
  # garbage collect all unused nix store entries
  sudo nix-collect-garbage --delete-old
