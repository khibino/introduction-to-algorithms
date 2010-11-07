open Array

let bubble_sort _A =
  let length_A = length _A in
  for i = 0 to length_A - 1
  do for j = length_A - 1 downto i + 1
    do if _A.(j) < _A.(j - 1)
      then let tmp = _A.(j) in
           _A.(j) <- _A.(j - 1);
           _A.(j - 1) <- tmp
    done
  done

let print_array _A =
  print_string "[";
  iter (Printf.printf "%d;") _A;
  print_endline "]"

let test sort _A =
  print_endline "Input: ";
  print_array _A;
  sort _A;
  print_endline "Output: ";
  print_array _A;
  print_newline ()

let _ =
  List.map
    (test bubble_sort)
    [[|5; 2; 4; 6; 1; 3|];
     [|31; 41; 59; 26; 41; 58|]]

(* http://ideone.com/29XIr *)
