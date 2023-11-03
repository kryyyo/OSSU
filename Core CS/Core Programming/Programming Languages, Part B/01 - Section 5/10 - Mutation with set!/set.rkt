#lang racket
(provide (all-defined-out))

(define b 3)
(define f (lambda (x) (* 1 (+ x b)))) ; -> not yet done, can mutate b
(define c (+ b 4))   ; 7 -> done already, cannot mutate b already
(set! b 5)
(define z (f 4))     ; 9
(define w c)         ; 7



; top-level
; making copy of the mutable variable
(define b 3)
(define f
  (let ([b b])
    (lambda (x) (* 1 (+ x b)))))

; making copy of everything including operations
(define f
  (let ([b b]
        [+ +]  ; but this is not already allowed in Racket because the modules for primitives are immutable!
        [* *]) ; but this is not already allowed in Racket because the modules for primitives are immutable!
    (lambda (x) (* 1 (+ x b)))))