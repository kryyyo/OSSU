(* this is a comment. our first program *)

val x = 34;
(* static environment: x : int *)
(* dynamic environment: x --> 34 *)

val y = 17;
(* static environment: x : int, y : int *)
(* dynamic environment: x --> 34, y --> 17 *)

val z = (x + y) + (y + 2);
(* static environment: x : int, y : int, z : int *)
(* dynamic environment: x --> 34, y --> 17, z --> 70 *)

val abs_of_z = if (z < 0) then 0 - z else z; (* bool *) (* int *) (* int *)
(* static environment: x : int, y : int, z : int, abs_of_z : int *)
(* dynamic environment: x --> 34, y --> 17, z --> 70, abs_of_z --> 70 *)

val abs_of_z_simpler = abs z;
