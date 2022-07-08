{lib}: {
  debug = import ./debug.nix {inherit lib;};
  hex = import ./hex.nix {inherit lib;};
  math = import ./math.nix {inherit lib;};
}
