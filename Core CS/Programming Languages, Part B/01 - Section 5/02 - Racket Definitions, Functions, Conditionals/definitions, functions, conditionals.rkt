#lang racket

; defining a variable
(define x 3)

; function calling
(define y (+ x 2))

; defining a function using anonymous function (lambda)
(define cube1
  (lambda (x)
    (* x (* x x))))

; simplifying multiplication expression since * can take multiple arguments
(define cube2
  (lambda (x)
    (* x x x)))

; syntactic sugar for lambda (as parameters, not tuples)
(define (cube3 x)
  (* x x x))

; conditionals: parenthesis matters!
; (if e1 e2 e3)
(define (pow1 x y)
  (if (= y 0)
      1
      (* x (pow1 x (- y 1)))))

; currying in racket (not really ideal)
(define pow2
  (lambda (x)
    (lambda (y)
      (pow1 x y))))

; pow1 and pow2 difference in function calling:
; (define sixteen (pow1 4 2))
; (define sixteen ((pow2 4) 2))
;        ---> need parenthesis because we use the return value of the expression (pow2 4)
;        ---> reason why currying is not ideal in racket