
module R = Random

let () = R.self_init ()

let random a b = R.int (b + 1 - a) + a

let random a b = Random.int (b + 1 - a) + a

let biased_random p =
  let v = R.float 1. in
  if v < p then 1
  else          0

let testAB a b  =
  let rec t n =
    if n = 0 then []
    else (random a b) :: t (n - 1)
  in t 100

let test0 () = testAB 0 1
let test1 () = testAB 3 5
