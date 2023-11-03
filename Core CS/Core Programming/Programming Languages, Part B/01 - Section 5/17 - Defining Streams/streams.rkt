#lang racket

; 1 1 1 1 1 1 ...
(define ones (lambda () (cons 1 ones))) ; '(value . thunk) CORRECT

(define ones-really-bad (cons 1 ones-really-bad)) ; '(value . pair) WRONG
(define ones-bad (lambda () (cons 1 (ones-bad)))) ; '(value . value) WRONG

; 1 2 3 4 5 ...
(define (f x) (cons x (lambda () (f (+ x 1)))))
(define nats (lambda () (f 1)))

; better style for the above functions
(define nats
  (letrec ([f (lambda (x) (cons x (lambda () (f (+ x 1)))))])
    (lambda () (f 1))))


; 2 4 8 16 ...
(define powers-of-two
  (letrec ([f (lambda (x) (cons x (lambda () (f (* x 2)))))])
    (lambda () (f 2))))

; stream-maker helper
; define (stream-maker fn arg) ...)
