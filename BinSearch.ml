open Array

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

open Show

let _ =
  (test_search binary_search [|1;4;9;16;25|] 16,
   test_search binary_search [|1;4;9;16;25|] 15)
