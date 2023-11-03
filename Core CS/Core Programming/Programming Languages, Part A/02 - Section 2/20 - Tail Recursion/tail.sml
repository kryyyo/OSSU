fun fact n = if n = 0 then 1 else n * fact(n-1)

val x = fact 3

fun fact_tail n =
    let
	fun fact (n, acc) =
	    if n = 0
	    then acc
	    else fact(n - 1, n * acc)
    in
	fact(n, 1)
    end

val y = fact 3
