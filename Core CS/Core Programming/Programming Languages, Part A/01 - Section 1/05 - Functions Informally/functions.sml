(* Programming Languages, Dan Grossman *)
(* Section 1: simple functions *)

(* this function correct only for y >= 0 *)
fun pow (x: int, y: int) =
    if y = 0
    then 1
    else x * pow(x, y-1);

fun cube (x: int) = pow(x, 3);