; ex 1.3

(define (square x) 
	(* x x)
)

(define (sum_of_squares x y) 
	(+ (square x) (square y))
)

(define (sum_of_larger_number_squares x y z) 
	(cond 
		((and (>= x y) (<= y z)) (sum_of_squares x z))
		((and (<= x y) (<= x z)) (sum_of_squares y z))
		(else (sum_of_squares x y))
	)
)

; testing:

(define test 
	(=
		13
		(sum_of_larger_number_squares 1 2 3)
		(sum_of_larger_number_squares 3 2 1)
		(sum_of_larger_number_squares 3 1 2)
		(sum_of_larger_number_squares 2 1 3)
		(sum_of_larger_number_squares -1 2 3)
		(sum_of_larger_number_squares 2 0 3)
	)
)

; => #t