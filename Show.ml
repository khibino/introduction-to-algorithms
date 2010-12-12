open Array

let print_array _A =
  print_string "[";
  iter (Printf.printf "%d;") _A;
  print_endline "]"

let test_sort sort _A =
  print_endline "Input: ";
  print_array _A;
  sort _A;
  print_endline "Output: ";
  print_array _A;
  print_newline ()

let test_search search _A key =
  print_endline "Input: ";
  print_array _A;
  print_endline "Output: ";
  Printf.printf "key = %d\nOutput: \n%d\n" key (search _A key)


