#lang racket
(define (slow-add x y)
  (letrec ([slow-id (lambda (y z)
                      (if (= 0 z)
                          y
                          (slow-id y (- z 1))))])
    (+ (slow-id x 50000000) y)))

(define (my-mult x y-thunk)
  (cond [(= x 0) 0]
        [(= x 1) (y-thunk)]
        [#t (+ (y-thunk) (my-mult (- x 1) y-thunk))]))


(define (my-delay th)
  (mcons #f th)) ;; a one-of type we will update in place

(define (my-force p)
  (if (mcar p)
      (mcdr p)                        ; returns result of th already
      (begin (set-mcar! p #t)
             (set-mcdr! p ((mcdr p))) ; called th and set the result as mcdr of mcons
             (mcdr p))))              ; returns result of th already

; sample invocation
(my-mult 1 (let ([p (my-delay (lambda () (slow-add 3 4)))])
             (lambda () (my-force p))))

(my-mult 100 (let ([p (my-delay (lambda () (slow-add 3 4)))])
               (lambda () (my-force p))))