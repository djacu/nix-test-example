{lib}: {
  math = import ./math.nix {inherit lib;};
  hex = import ./hex.nix {inherit lib;};
}
