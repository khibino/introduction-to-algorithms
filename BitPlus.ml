open Array

let plus _A _B =
  let n  = length _A in
  let _C = make (n + 1) 0 in
  let c = ref 0 in
  for i = 0 to n - 1 
  do let s = _A.(i) + _B.(i) + !c in
     if      s = 3 then (c := 1; _C.(i) <- 1)
     else if s = 2 then (c := 1; _C.(i) <- 0)
     else if s = 1 then (c := 0; _C.(i) <- 1)
     else if s = 0 then (c := 0; _C.(i) <- 0)
     else failwith "error"
(*
  match s with
    | 3 -> c := 1; _C.(i) <- 1
    | 2 -> c := 1; _C.(i) <- 0
    | 1 -> c := 0; _C.(i) <- 1
    | 0 -> c := 0; _C.(i) <- 0
    | _ -> failwith "error"
*)
  done;
  _C.(n) <- !c;
  _C


  
