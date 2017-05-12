; ex 1.7

; вычисляет корень третьей степени от x
(define (cube-root x)

 	; возводит x в квадрат
 	(define (square x)
 		(* x x)	
 	)

	; вычисляет новое приближение корня третьей степени от x
	(define (improve guess x)
		(/ (+ (/ x (square guess)) (* 2 guess)) 3)
	)

	; определяет, с достаточной ли точностью мы определили результат
	(define (good-enough? guess prev-guess)
		(= guess prev-guess)
	)

    ; итеративно вычисляет корень третьей степени от x
    (define (cube-root-iter guess prev-guess x)
    	(if (good-enough? guess prev-guess)
    		guess
    		(cube-root-iter (improve guess x) guess x)
    	)
    )

    ; запускает вычисление
    (cube-root-iter 1.0 0 x)

)

; testing 

(define (pow x n)
	(if (= n 1)
		x
		(* x (pow x (- n 1)))    
	)  
)

(cube-root (pow 0.1234 3))
; => 0.1234

(cube-root (pow 1234 3))
; => 1234

(cube-root (pow (pow 10 20) 3))
; => 100000000000000000000