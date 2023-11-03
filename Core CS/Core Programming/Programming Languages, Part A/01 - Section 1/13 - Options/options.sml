fun max1 (xs: int list) =
    if null xs
    then NONE (* int option *)
    else
	let
	    val tl_ans = max1(tl_xs) (* int option *)
	in
	    (* if isSome int option andalso valOf int option > int *)
	    (* if boolean andalso int > int *)
	    (* if boolean andalso boolean *)
	    if isSome tl_ans andalso valOf tl_ans > hd xs
	    then tl_ans (* int option *)
	    else SOME (hd xs) (* int option *)
	end


fun max2 (xs: int list) =
    if null xs
    then NONE (* int option *)
    else
	let
	    fun max_nonempty (xs: int list) =
		if null (tl xs)
		then hd xs (* int *)
		else
		    let val tl_ans = max_nonempty(tl_xs) (* int *)
		    in
			if hd xs > tl_ans
			then hd xs (* int *)
			else tl_ans (* int *)
		    end
	in
	    (* SOME int *)
	    SOME(max_nonempty xs) (* int option *)
	end
