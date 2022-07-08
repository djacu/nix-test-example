# to run these tests:
# nix eval .#tests.hex
# if the resulting list is empty, all tests passed
{lib}: let
  hex = import ../hex.nix {inherit lib;};
  inherit (lib) runTests;
in
  runTests {
    testHexToDec_1 = {
      expr = hex.hexToDec "12";
      expected = 18;
    };

    testHexToDec_2 = {
      expr = hex.hexToDec "FF";
      expected = 255;
    };

    testHexToDec_3 = {
      expr = hex.hexToDec "abcdef";
      expected = 11259375;
    };
  }
