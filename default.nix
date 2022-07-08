{lib}: rec {
  tests = import ./lib/tests {inherit lib;};
  allTestsPass = builtins.all (x: x == []) (builtins.attrValues tests);
}
