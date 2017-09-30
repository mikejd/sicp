; возводит x в степень y
(define (^ x y)
	(define (^iter x y accum)
		(if
			((= y 0) accum)
			(else (^iter x (- y 1) (* x accum)))
		)
	)
	(^iter x y 1)
)