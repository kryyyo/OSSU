datatype mytype = TwoInts of (int * int)
		| Str of string
       | Pizza

(* mytype -> int *)
fun f (x: mytype) =
    case x of
	Pizza => 3
     |  Str s => 8
     |  TwoInts(i1, i2) => i1 + i2
(* |  Pizza => 12 (* redundant match *) *)


(* missing cases: TwoInts and Str *)
fun g (x: mytype) =
    case x of
	Pizza => 3
