#lang racket
(provide (all-defined-out))

(define (factorial-normal x)
  (if (= x 0)
      1
      (* x (factorial-normal (- x 1)))))

(define (my-if-bad x y z)
  (if x y z))

(define (factorial-bad x)
  (my-if-bad (= x 0)
             1
             (* x (factorial-bad (- x 1)))))


; e2 and e3 should be zero-argument functions (delays evaluation)
(define (my-if-strange-but-works e1 e2 e3)
  (if e1 (e2) (e3))) ; (e)

(define (factorial-okay x)
  (my-if-strange-but-works
   (= x 0)
   (lambda () 1)
   (lambda () (* x (factorial-okay (- x 1))))))

