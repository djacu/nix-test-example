# to run these tests:
# nix eval .#tests.debug
# if the resulting list is empty, all tests passed
{lib}: let
  debug = import ../debug.nix;
  inherit (lib) runTests;
in
  runTests {
    testCheckAllListsEmpty_1 = {
      expr = debug.checkAllListsEmpty {
        a = [];
        b = [];
        c = [];
      };
      expected = true;
    };

    testCheckAllListsEmpty_2 = {
      expr = debug.checkAllListsEmpty {
        a = [];
        b = [2];
        c = [];
      };
      expected = false;
    };
  }
