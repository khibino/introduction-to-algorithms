
(* open Array *)

type heap = {
  store  : int array;
  mutable length    : int;
  mutable heap_size : int;
}

let heap a =
  let len = Array.length a in {
    store = a;
    length    = len;
    heap_size = len;
  }

let ( *.) : heap -> int -> int =
  fun heap i -> heap.store.(i - 1)

let (<-->) : (heap * int) -> (heap * int) -> unit =
  fun (a, ia) (b, ib) ->
  let tmp = a.store.(ia - 1) in
  a.store.(ia - 1) <- b.store.(ib - 1);
  b.store.(ib - 1) <- tmp

(* let length    : heap -> int = fun heap -> heap.length *)
(* let heap_size : heap -> int = fun heap -> heap.heap_size *)


let parent i = i / 2

let left   i = 2 * i

let right  i = 2 * i + 1

(* l : int
   r : int
   largest : int ref
   (!) : 'a ref -> 'a
*)

let rec max_heapify _A i =
  let l = left  i in
  let r = right i in
  let largest = ref (-1) in

  if l <= _A.heap_size && _A*.l > _A*.i
  then largest := l
  else largest := i
  ;
  if r <= _A.heap_size && _A*.r > _A*.(!largest)
  then largest := r
  ;
  if !largest <> i
  then begin
    Printf.printf "swap: i = %d, largest = %d\n" i !largest;
    (_A, i) <--> (_A, !largest);
    max_heapify _A !largest
  end

let rec build_max_heap _A =
  _A.heap_size <- _A.length;
  for i = _A.length / 2 downto 1
  do
    max_heapify _A i;
    Show.print_array _A.store
  done
