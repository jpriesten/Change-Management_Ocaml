(* This class will be used to create all the main functions of a cell, which will include:
creating an activity
Modifying an activity
viewing an activity
deleting an activity *)
open Printf;;
open ChangeMA;;
(* open Core.Std;; *)


let change = new change_ma;;

class cell = object(self)
  (* val change = new change_ma *)
  val mutable cellDic = ()
  (* user needs to set the cell name  *)
  val mutable file = change#getCellName ^ ".dat"

  (* write data to a cell *)
  method createActivity title body =
    let c_outfile = open_out file in 
      fprintf c_outfile "%s \n %s" title body;
      close_out c_outfile;

  method viewActivity =  
    let v_infile = open_in file in 
    try
      let line = input_line v_infile in
        printf ">>>%s\n" line;
        flush stdout;
        close_in v_infile;
    with e ->
      close_in_noerr v_infile;
      raise e
    
  method modifyActivity title body = 
    let m_outfile = open_out file in 
    fprintf m_outfile "Title: %s \t Body: %s" title body;
    close_out m_outfile;
end

let cel = new cell;;
cel#createActivity "priesten" "My name is Priesten and i am a graduate";;
cel#viewActivity;;
(* change#grid;;
printf "> %s \n" change#getCellName;;
change#setCellName "4A";;
printf "> %s \n" change#getCellName;; *)