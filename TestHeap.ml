
open Heap

(* 6.2-1 *)
let t6_2_1 () =
  let h = heap [| 27; 17; 3; 16; 13; 10; 1; 5; 7; 12; 4; 8; 9; 0 |] in
  max_heapify h 3;
  h

let t6_3_1 () =
  let h = heap [| 5; 3; 17; 10; 84; 19; 6; 22; 9 |] in
  build_max_heap h;
  h
