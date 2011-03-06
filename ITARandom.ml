
module R = Random

let () = R.self_init ()

let random a b = R.int (b + 1 - a) + a

let biased_random p =
  let v = R.float 1. in
  if v < p then 0
  else          1

let test0 () =
  let rec t n =
    if n = 0 then []
    else (random 3 5) :: t (n - 1)
  in t 100
