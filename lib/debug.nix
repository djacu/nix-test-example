{
  /*
   Check that an attrSet of lists contains only empty lists.
   Type: checkAllListsEmpty :: attrset -> bool
   Args:
     set: An attrset of lists.
   Example:
     checkAllListsEmpty { a = []; b = []; c = []; }
     => true
     checkAllListsEmpty { a = []; b = [ 2 ]; c = []; }
     => false
   */
  checkAllListsEmpty = set: let
    inherit (builtins) all attrValues;
  in
    all (x: x == []) (attrValues set);
}
