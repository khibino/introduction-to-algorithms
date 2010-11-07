open Array

let selection_sort _A =
  let length_A = length _A in
  for i = 0 to length_A - 2
  do let k = ref i in
     for j = i + 1 to length_A - 1
     do if _A.(!k) > _A.(j) then
         k := j
     done;
     let tmp = _A.(i) in
     _A.(i) <- _A.(!k);
     _A.(!k) <- tmp
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
    (test selection_sort)
    [[|0|];
     [|5; 2; 4; 6; 1; 3|];
     [|31; 41; 59; 26; 41; 58|]]
