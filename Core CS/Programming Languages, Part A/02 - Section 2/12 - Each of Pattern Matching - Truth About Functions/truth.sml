
(* bad style: one arm case expressions *)
fun sum_triple1 triple =
    case triple of
	(x, y, z) => x + y + z

fun full_name1 r =
    case r of
	{ first = x, middle = y, last = z } => x ^ " " ^ y ^ " " ^ z

(* okay style *)
fun sum_triple2 triple =
    let
	val (x,y,z) = triple
    in
	x + y + z
    end
	
fun full_name2 r =
    let
	val { first = x, middle = y, last = z } = r
    in
	x ^ " " ^ y ^ " " ^ z
    end

(* best style *)
fun sum_triple3 (x, y, z) =
    x + y + z

fun full_name3 {first = x, middle = y, last = z} =
    x ^ " " ^ y ^ " " ^ z

(* things you cannot do in Java *)
fun rotate_left (x, y, z) = (y, z, x)
				
fun rotate_right t = rotate_left(rotate_left t)
				
