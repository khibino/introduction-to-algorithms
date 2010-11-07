open Array

let _NIL = min_int

let linear_search _A v =
  let length_A = length _A in
  let i = ref 0 in
  while !i < length_A && _A.(!i) <> v
  do i := !i + 1
  (* i.contents <- i.contents + 1 *)
  done;
  if !i < length_A then !i
  else _NIL


let print_array _A =
  print_string "[";
  iter (Printf.printf "%d;") _A;
  print_endline "]"

let test (_A, v)  =
  print_endline "Input: ";
  print_array _A;
  Printf.printf "v = %d\n" v;
  print_endline "Output: ";
  Printf.printf "i = %d\n" (linear_search _A v)

let _ =
  List.map
    test
    [([|3; 1; 2; 4;|], 2);
     ([|3; 1; 2; 4;|], 5)]
