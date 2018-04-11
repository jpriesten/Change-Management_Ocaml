open Printf
  
let file = "example.dat"
let message = "Hello!"
  
 let () =
  (* Write message to file *)
  let oc = open_out_bin file in    (* create or truncate file, return channel *)
    Marshal.to_channel oc message [Closures];
  (* fprintf oc "%s\n" message;   (* write something *)    *)
  close_out oc;                (* flush and close the channel *)
;;
(*
  (* Read file and display the first line *)
  let ic = open_in file in
  try 
    let line = input_line ic in  (* read line from in_channel and discard \n *)
    print_endline line;          (* write the result to stdout *)
    flush stdout;                (* write on the underlying device now *)
    close_in ic                  (* close the input channel *) 
  
  with e ->                      (* some unexpected exception occurs *)
    close_in_noerr ic;           (* emergency closing *)
    raise e                      (* exit with error: files are closed but
                                    channels are not flushed *) *)
                              
                                                                       
let () = 
  let in_chan = open_in_bin file in
  try
    let values = Marshal.from_channel in_chan;
    (* while true do
      let line = input_line in_chan in 
        print_endline line;
        printf "> %s \n" line
    done *)
  with End_of_file ->
    close_in in_chan
;;