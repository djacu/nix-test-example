{
  lib,
  math ? import ./math.nix {inherit lib;},
}: rec {
  hexToDecMap = {
    "0" = 0;
    "1" = 1;
    "2" = 2;
    "3" = 3;
    "4" = 4;
    "5" = 5;
    "6" = 6;
    "7" = 7;
    "8" = 8;
    "9" = 9;
    "a" = 10;
    "b" = 11;
    "c" = 12;
    "d" = 13;
    "e" = 14;
    "f" = 15;
  };

  /*
   Conversion from base 16 to base 10 with a exponent. Is of the form
   scalar * 16 ** exponent.
   Type: base16To10 :: int -> int -> int
   Args:
     exponent: The exponent for the base, 16.
     scalar: The value to multiple to the exponentiated base.
   Example:
     base16To10 0 11
     => 11
     base16To10 1 3
     => 48
     base16To10 2 7
     1792
     base16To10 3 14
     57344
   */
  base16To10 = exponent: scalar: scalar * math.pow 16 exponent;

  /*
   Converts a hexadecimal character to decimal.
   Only takes a string of length 1.
   Type: hexCharToDec :: string -> int
   Args:
     hex: A hexadecimal character.
   Example:
     hexCharToDec "5"
     => 5
     hexCharToDec "e"
     => 14
     hexCharToDec "A"
     => 10
   */
  hexCharToDec = hex: let
    inherit (lib) toLower;
    lowerHex = toLower hex;
  in
    if builtins.stringLength hex != 1
    then throw "Function only accepts a single character."
    else if hexToDecMap ? ${lowerHex}
    then hexToDecMap."${lowerHex}"
    else throw "Character ${hex} is not a hexadecimal value.";

  /*
   Converts from hexadecimal to decimal.
   Type: hexToDec :: string -> int
   Args:
     hex: A hexadecimal string.
   Example:
     hexadecimal "12"
     => 18
     hexadecimal "FF"
     => 255
     hexadecimal "abcdef"
     => 11259375
   */
  hexToDec = hex: let
    inherit (lib) stringToCharacters reverseList imap0 foldl;
    decimals = builtins.map hexCharToDec (stringToCharacters hex);
    decimalsAscending = reverseList decimals;
    decimalsPowered = imap0 base16To10 decimalsAscending;
  in
    foldl builtins.add 0 decimalsPowered;
}
