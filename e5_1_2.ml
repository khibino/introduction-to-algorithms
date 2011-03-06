
let random01 () = ITARandom.random 0 1

(*
let rmax  = 0x20000000
let pivot = rmax / 2

let random01 () =
  let v = Random.int rmax in
  if v < pivot then 0
  else              1
*)

let int n' =
  let n = n' - 1 in
  let rec randOr s =
    if s < 0 then 0
    else (n land ((random01 ()) lsl s)) lor randOr (s - 1)
    (* else (n land (1 lsl s)) lor randOr (s - 1) *)
  in randOr (Sys.word_size - 2)

let random a b = int (b + 1 - a) + a

let testAB a b  =
  let rec t n =
    if n = 0 then []
    else (random a b) :: t (n - 1)
  in t 300

let test0 () = testAB 0 1
let test1 () = testAB 0 2
let test2 () = testAB 3 5

let test3 () = testAB 0 15
