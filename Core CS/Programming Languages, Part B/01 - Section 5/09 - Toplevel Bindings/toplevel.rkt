#lang racket
(provide (all-defined-out))

(define (f x) (+ x (* x b)))
(define b 3)
(define c (+ b 4))
; (define d (+ e 4)) e will be evaluated since it is not inside a function body, but is not defined yet here
(define e 5)
; (define f 17) error because f is already defined