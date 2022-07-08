{lib}: let
  debug = import ./lib/debug.nix;
in rec {
  tests = import ./lib/tests {inherit lib;};
  allTestsPass = debug.checkAllListsEmpty tests;
}
