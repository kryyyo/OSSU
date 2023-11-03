fun sum xs =
    case xs of
	[] => 0
     |  x::xs => x + sum xs'

fun sum xs =
    let fun aux (xs, acc) =
	    case xs of
		[] => acc
	     |  x::xs' => aux(xs', x + acc)
    in
	aux (xs, 0)
    end

fun rev xs =
    case xs of
	[] => []
     |  x::xs' => (rev xs') @ [x]

fun rev xs =
    let fun aux (xs, acc) =
	    case xs of
		[] => acc
	     |  x::xs' => aux(xs', x::acc)
    in
	aux(xs, [])
    end


	
