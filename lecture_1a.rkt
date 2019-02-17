#lang racket

;;;;;;;;;;;;;;;;;;;;;
;; SQRT definition ;;
;;;;;;;;;;;;;;;;;;;;;

(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y)
     2))

(define (good-enough? guess x)
  (< (abs (- (square guess)
             x))
     0.001))

(define (try guess x)
  (if (good-enough? guess x)
      guess
      (try (average guess (/ x guess))
           x)))

(define (sqrt x)
  (try 1.0 x))


;; Definition using a better strategy for "good-enough?".
(define (sqrt* x)
  (define (good-enough? guess-new guess-old)
    (< (/ (abs (- guess-new guess-old))
          guess-new)
       0.001))
  (define (try guess-new guess-old)
    (if (good-enough? guess-new guess-old)
        guess-new
        (try (average guess-new (/ x guess-new))
             guess-new)))
  (try 1.0 0.0))
