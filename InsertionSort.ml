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

open Show

let _ =
  List.map
    (test_sort insertion_sort)
    [[|0|];
     [|5; 2; 4; 6; 1; 3|];
     [|31; 41; 59; 26; 41; 58|]]

(* http://ideone.com/7Xzv4 *)

(* http://ideone.com/URgrg *)
