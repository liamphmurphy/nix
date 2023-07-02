It can be easy to forget the exact steps to get home-manager setup, the steps below cover how to get everything up and running.

# Setting Up

1. Installing home-manager. Refer to the instructions here (will almost always want the standalone installation): https://nix-community.github.io/home-manager/index.html#sec-install-standalone

2. Clone this repo 

3. Update the flake lock file (to get newest package versions):
```
nix flake --extra-experimental-features nix-command --extra-experimental-features flakes update --commit-lock-file
```

4. Run switch and make sure to include the experimental features flags:
```
home-manager switch --extra-experimental-features nix-command --extra-experimental-features flakes --flake .#liam
```
