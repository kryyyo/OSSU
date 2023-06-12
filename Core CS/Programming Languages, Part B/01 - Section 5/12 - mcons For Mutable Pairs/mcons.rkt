#lang racket
(provide (all-defined-out))

(define mpr (mcons 1 (mcons #t "hi")))
; (car mpr) -> error, you cannot use list functions in mcons
(mcar mpr) ; correct
; (cdr mpr) -> error, you cannot use list functions in mcons
(mcdr mpr) ; correct

; mutating
(set-mcar! mpr 47) ; (set-mcar! <your mcons> <e>)
(set-mcdr! (mcdr mpr) 14) ; (set-mcdr! <your mcons> <e>)

; (length mpr) -> error, you cannot use list functions in mcons