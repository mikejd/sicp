; ex 1.10

; ИСХОДНЫЕ ДАННЫЕ

; функция Аккермана имеет следующий вид
(define (A x y)
	(cond 
		((= y 0) 0)
		((= x 0) (* 2 y))
		((= y 1) 2)
		(else (A (- x 1) (A x (- y 1))))	
	)
)

; РЕШЕНИЕ

; вычисляем (A 1 10)
(A 0 (A 1 9))
(* 2 (A 1 9))
(* 2 (A 0 (A 1 8)))
(* 2 (* 2 (A 1 8)))
; …
; => 2 ^ 10 = 1024

; вычисляем (A 2 1) 
; …
; => 2

; вычисляем (A 2 2)
(A 1 (A 2 1))
(^ 2 2) ; данная функция возведения в степень описана в библиотеке common.scm
; => 4

; вычисляем (A 2 3)
(A 1 (A 2 2))
(^ 2 (A 2 2))
(^ 2 (A 1 (A 2 1)))
(^ 2 (A 1 2))
(^ 2 4)
; => 16

; вычисляем (A 2 4)
(A 1 (A 2 3)) ; положим, что (A 2 3) = x, тогда из предыдущего приходим к виду (^ 2 x)
(^ 2 (A 2 3))
(^ 2 (A 1 (A 2 2)))
(^ 2 (^ 2 (A 2 2)))
(^ 2 (^ 2 (A 1 (A 2 1))))
(^ 2 (^ 2 (^ 2 (A 2 1))))
(^ 2 (^ 2 (^ 2 2)))
(^ 2 (^ 2 4))
(^ 2 16)
; => 65 536

; вычиляем (A 2 5)
(A 1 (A 2 4)) ; из предыдущего примеры приходим к решению
(^ 2 65536)
; => очень большое число

; вычисляем (A 3 3)
(A 2 (A 3 2)) 
(A 2 (A 2 (A 3 1)))
(A 2 (A 2 2))
(A 2 (A 1 (A 2 1)))
(A 2 (A 1 2))
(A 2 (A 0 (A 1 1)))
(A 2 (A 0 2))
(A 2 (* 2 2))
(A 2 4)
; => 65 536

; ОТВЕТЫ:

; вычисляет (* 2 n)
(define (f n) (A 0 n))

; вычисляет (^ 2 n)
(define (g n) (A 1 n))

; не уверен, что мое описание математически верно, но своими словами:
; последовательно возводит двойку в квадрат (n - 1) раз 
; например, при n = 4 результатом будет (^ (^ (^ 2 2) 2) 2)
(define (h n) (A 2 n))