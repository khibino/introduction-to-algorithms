open Array

let merge _A p q r =
  let n_1 = q - p + 1 in
  let n_2 = r - q in
  let _L = make (n_1 + 1) 0 in
  let _R = make (n_2 + 1) 0 in
  for i = 0 to n_1 - 1
  do _L.(i) <- _A.(p + i - 1) done;
  for j = 0 to n_2 - 1
  do _R.(j) <- _A.(q + j) done;
  _L.(n_1) <- max_int;
  _R.(n_2) <- max_int;
  let i = ref 0 in
  let j = ref 0 in
  for k = p - 1 to r - 1
  do
    if _L.(!i) <= _R.(!j)
    then (_A.(k) <- _L.(!i);
          i := !i + 1)
    else (_A.(k) <- _R.(!j);
          j := !j + 1)
  done

let merge_sort _A =
  let rec merge_sort _A p r =
    if p < r then
      let q = (p + r) / 2 in
      merge_sort _A p q;
      merge_sort _A (q + 1) r;
      merge _A p q r
  in merge_sort _A 1 (length _A)

open Show

let _ =
  List.map
    (test_sort merge_sort)
    [[|5; 2; 4; 6; 1; 3|];
     [|31; 41; 59; 26; 41; 58|]]

(* http://ideone.com/HEQ9W *)
