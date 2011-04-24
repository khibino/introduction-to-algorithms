
let random01 () = ITARandom.random 0 1

(*
let rmax  = 0x20000000
let pivot = rmax / 2
*)

let power_rand' bit =
  let rec power_rand bit =
    if bit < 0 then 0
    else ((random01 ()) lsl bit) lor power_rand (bit - 1)
  in power_rand bit

let power_rand n = power_rand' (Bit.msb n)

let int0 n =
  let rec trys () =
    let v = power_rand n in
    if v < n then v
    else trys ()
  in trys ()

let (-|) = Int64.sub
let (+|) = Int64.add
let (%|) = Int64.rem

type int_gen =
    Gen of (unit -> (int * int_gen))

let make_int : int -> int_gen = fun n ->
  (* 呼ぶ度に偏りが変わる *)
  (* 偏りの周期が短いのが問題であるかどうか *)

  let n64 = Int64.of_int n in
  let msb = Bit.msb n in
  let filled = Int64.of_int (Bit.filled msb) in

  let with_deviation : int64 -> (int * int64) = fun deviation ->
    let deviation_next = (filled -| n64 +| Int64.one +| deviation) %| n64 in
    (Int64.to_int ((Int64.of_int (power_rand' msb) +| deviation) %| n64),
     deviation_next)
  in

  let rec int : int64 -> unit -> (int * int_gen) = fun deviation () ->
    let (v, d) = with_deviation deviation in
    Printf.printf "deviation = %d\n" (Int64.to_int d);
    (v, Gen (int d))
  in Gen (int Int64.zero)

module M = Hashtbl

let gen_map : (int, int_gen) M.t = M.create 0x100

let int n =
  let Gen gen =
    (try 
       M.find gen_map n
     with
       | Not_found ->
         M.add gen_map n (make_int n);
         M.find gen_map n)
  in
  let (v, next) = gen () in
  M.replace gen_map n next;
  v

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
