#lang racket

; no memoization version
; 2 recursive calls, expensive computations
(define (fibonacci1 x)
  (if (or (= x 1) (= x 2))
      1
      (+ (fibonacci1 (- x 1))     ; 1st recursive call
         (fibonacci1 (- x 2)))))  ; 2nd recursive call

; no memoization version 2
; but uses accumulators
; better but do not use our concepts of delay, evaluates acc immediately
(define (fibonacci2 x)
  (letrec ([f (lambda (acc1 acc2 y)
                (if (= y x)
                    (+ acc1 acc2)
                    (f (+ acc1 acc2) acc1 (+ y 1))))])
    (if (or (= x 1) (= x 2))
        1
        (f 1 1 3))))

(define fibonacci3
  (letrec ([memo null]                                                   ; stores our result '(arg . result)
           [f (lambda (x)
                (let ([ans (assoc x memo)])                              ; finds answer in the table, returns the pair '(arg . result), returns #f if not found
                      (if ans                                            ; value = true if found
                          (cdr ans)                                      ; return the result of our answer from the pair '(arg . result)
                          (let ([new-ans (if (or (= x 1) (= x 2))
                                             1
                                             (+ (fibonacci1 (- x 1))     ; 1st recursive call, always stores results in memo (commonly can store ALMOST ALL results that can be used by the proceeding calls)
                                                (fibonacci1 (- x 2))))]) ; 2nd recursive call, rarely stores, commonly always finds results in memo table due to the 1st recursive call
                            (begin
                              (set! memo (cons (cons x new-ans) memo))   ; storing of the ans in our memo (storage table)
                              new-ans)))))])                             ; returning of the ans
    f))
                          
                                         