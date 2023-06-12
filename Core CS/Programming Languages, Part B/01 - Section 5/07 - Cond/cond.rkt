#lang racket
(provide (all-defined-out))

(define xs (list 4 5 6))
(define ys (list (list 4 (list 5)) 6 7 (list 8) 9 2 3 (list 0 1)))

(define (sum1 xs)
  (if (null? xs)
      0
      (if (number? (car xs))
          (+ (car xs) (sum1 (cdr xs)))           ; handle number types
          (+ (sum1 (car xs)) (sum1 (cdr xs)))))) ; handle list of numbers types

(define (sum2 xs)
  (if (null? xs)
      0
      (if (number? (car xs))
          (+ (car xs) (sum1 (cdr xs)))           ; handle number types
          (if (list? (car xs))
              (+ (sum1 (car xs)) (sum1 (cdr xs))); handle list of numbers types
              (sum2 (cdr xs))))))                ; handle any other types (skips it)


; rewriting with cond

; sum1
(define (sum3 xs)
  (cond [(null? xs) 0]
        [(number? (car xs)) (+ (car xs) (sum3 (cdr xs)))]
        [#t (+ (sum3 (car xs)) (sum3 (cdr xs)))]))


; sum2
(define (sum4 xs)
  (cond [(null? xs) 0]
        [(number? (car xs)) (+ (car xs) (sum4 (cdr xs)))]
        [(list? (car xs)) (+ (sum4 (car xs)) (sum4 (cdr xs)))]
        [#t (sum4 (cdr xs))]))

; using the concept #f is the only false answer
(define (count-falses xs)
  (cond [(null? xs) 0]
        [(car xs) (count-falses (cdr xs))]
        [#t (+ 1 (count-falses (cdr xs)))]))



