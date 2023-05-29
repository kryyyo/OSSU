(* old fashioned *)
(* fun nondecreasing xs = (* int list -> bool *)
    case xs of
	[] => true
      | x::xs' => case xs' of
		      [] => true
		    | y::ys' => x <= y andalso nondecreasing xs'
 *)

(* nested pattern matching *)
fun nondecreasing xs = (* int list -> bool *)
    case xs of
	[] => true                                              (* case for empty *)
      | _::[] => true                                           (* case for one element *)
      | head::(neck::rest) => head <= neck                      (* case for 2 or more elements *)
			      andalso nondecreasing(neck::rest) 

datatype sgn = P | N | Z

fun multsign (x1,x2) = (* int * int -> sgn *)
    let fun sign x = if x = 0 then Z else if x > 0 then P else N
    in
	case (sign x1, sign x2) of
	   (Z, _) => Z      (* any number times 0 is 0 therefore Z *)
	 | (_, Z) => Z
	 | (P, P) => P
	 | (N, N) => P
	 |  _ => N 
	 (* | (N, P) => N
	 | (P, N) => N *)
    end

fun len xs =
    case xs of
	[] => 0
      | _::xs' => 1 + len xs'
			  
