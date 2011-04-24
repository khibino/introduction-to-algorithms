
let max_bit = Sys.word_size - 3
let max_bit_val = 1 lsl max_bit

let msb' n =
  let rec msb bit =
    if bit < 0 then (-1, 0)
    else
      let bit_int = (1 lsl bit) in
      if n land bit_int != 0 then (bit, bit_int)
      else msb (bit - 1)
  in msb max_bit

let msb n = fst (msb' n)
let msb_val n = snd (msb' n)

let filled bit =
  if bit == max_bit then max_int
  else (1 lsl (bit + 1)) - 1

let fill n =
  filled (msb n)
