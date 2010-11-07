open Array

let insertion_sort _A =
  let len = length _A in
  for j = 1 to len - 1 do
    let key = _A.(j) in
    let i = ref (j - 1) in
    let _ = 
      while !i >= 0 && _A.(!i) > key do
        _A.(!i + 1) <- _A.(!i);
        i := !i - 1
      done
    in _A.(!i + 1) <- key
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
    (test insertion_sort)
    [[|0|];
     [|5; 2; 4; 6; 1; 3|];
     [|31; 41; 59; 26; 41; 58|]]

(* http://ideone.com/7Xzv4 *)

(* http://ideone.com/URgrg *)
