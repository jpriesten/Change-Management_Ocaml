(* This class creates a grid using a list data structure. It updates a cell name when it has been selected *)
open Printf;;
class change_ma = object(self)
  val mutable cell = ["3a"; "2a"; "1a"; "3b"; "2b"; "1b"; "3c"; "2c"; "1c"]
  val mutable cellName = "boss"
  method grid =
    printf "------------\n";
    printf "3A | 3B | 3C \n";
    printf "2A | 2B | 2C \n";
    printf "1A | 1B | 1C \n";
    printf "------------\n"; 

  method setCellName name =
    if List.mem (String.lowercase_ascii name) cell then
      cellName <- String.lowercase_ascii name  
    else printf "Invalid Cell Name, Try again \n"
         
  method getCellName =
    cellName;
end;;

(* let change = new change_ma;;
change#grid;;
printf "> %s \n" change#getCellName;;
change#setCellName "2A";;
printf "> %s \n" change#getCellName;; *)