; ex 1.6

; ВВОДНЫЕ ДАННЫЕ:

; возводит x в квадрат
(define (square x)
	(* x x)	
)

; определяет расстояние между x и y
(define (distance x y)
	(abs (- x y))
)

; определяет, с достаточной ли точностью мы определили корень 
(define (good-enough? guess x)
	(< (distance x (square guess)) 0.001)
)

; вычисляет среднее значение между x и y
(define (average x y)
	(/ (+ x y) 2)		
)

; вычисляет новое приближение квадратного корня от x
(define (improve guess x)
	(average guess (/ x guess))
)

; альтернативная реализация if через cond
(define (new-if predicate then-clause else-clause)
	(cond 
		(predicate then-clause)
		(else else-clause)
	)	
)

; необходимо объяснить, что получится если мы попытаемся использовать следующую процедуру
; для вычисления квадратных корней
(define (sqrt-iter guess x)
	(new-if (good-enough? guess x)
		guess
		(sqrt-iter (improve guess x) x)
	)
)

; ОТВЕТ: 
;
; Данная программа приведет к зацикливанию, т.к. при разборе обычных выражений (коим является 
; процедура new-if) интерпретатор следует аппликативному порядку вычисления и сначала вычисляет оба 
; аргумента (в данном случае then-clause и else-clause). Здесь это приводит к бесконечной рекурсии,
; поскольку else-clause вызывает sqrt-iter.
;
; Избежать проблемы можно, если вместо new-if использовать if, являющийся особой формой выражения, 
; для которого всегда вычисляется только одно из следствий.