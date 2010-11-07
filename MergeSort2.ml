(** ex.2.3-2 *)

open Array

let merge _A p q r =
  let n_1 = q - p + 1 in
  let n_2 = r - q in
  let _L = make (n_1) 0 in
  let _R = make (n_2) 0 in
  for i = 0 to n_1 - 1
  do _L.(i) <- _A.(p + i - 1) done;
  for j = 0 to n_2 - 1
  do _R.(j) <- _A.(q + j) done;
  let i = ref 0 in
  let j = ref 0 in
  let k = ref (p - 1) in
  while !i < n_1 && !j < n_2 && !k <= r - 1
  do
    if _L.(!i) <= _R.(!j)
    then (_A.(!k) <- _L.(!i);
          i := !i + 1)
    else (_A.(!k) <- _R.(!j);
          j := !j + 1);
    k := !k + 1
  done;
  if !i < n_1 then
    for i' = !i to n_1 - 1
    do _A.(!k + i' - !i) <- _L.(i') done
  else if !j < n_2 then
    for j' = !j to n_2 - 1
    do _A.(!k + j' - !j) <- _R.(j') done
  else ()

let merge_sort _A =
  let rec merge_sort _A p r =
    if p < r then
      let q = (p + r) / 2 in
      merge_sort _A p q;
      merge_sort _A (q + 1) r;
      merge _A p q r
  in merge_sort _A 1 (length _A)


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
    (test merge_sort)
    [[|5; 2; 4; 6; 1; 3|];
     [|31; 41; 59; 26; 41; 58|]]

(* http://ideone.com/eHuT2 *)
