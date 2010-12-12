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

let binary_search _A v =
  let rec binary_search p q =
    if q - p <= 1 then if _A.(p) = v then p else (-1)
    else
      let c = (p + q) / 2 in
        if v < _A.(c)  then binary_search p c
        else binary_search c q
  in 
  let length_A = length _A in
  binary_search 0 length_A

let find_pair _S x =
  merge_sort _S;
  let len = length _S in
  let i = ref 0 in
  let j = ref (-1) in
  while !j = -1 && !i < len
  do
    j := binary_search _S (x - _S.(!i));
    i := !i + 1;
  done;
  if !j = -1 then (-1, -1)
  else (!i - 1, !j)

open Show

let test_find_pair _S x =
  let (i, j) = find_pair _S x in
  Printf.printf "(%d, %d)\n" i j

let _ =
  (test_find_pair [|1;4;9;16;25|] 13,
   test_find_pair [|1;4;9;16;25|] 25,
   test_find_pair [|1;4;9;16;25|] 3)

