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


(define (good-enough?* guess-new guess-old)
  (< (/ (abs (- guess-new guess-old))
        guess-new)
     0.001))

;; Exercise 1.7
;; Definition using a better strategy for "good-enough?".
(define (sqrt* x)
  (define (try guess-new guess-old)
    (if (good-enough?* guess-new guess-old)
        guess-new
        (try (average guess-new (/ x guess-new))
             guess-new)))
  (try 1.0 0.0))


;; Exercise 1.8
(define (cube-root x)
  (define (approx guess)
    (/ (+ (/ x (square guess))
          (* 2 guess))
       3))
  (define (try guess-new guess-old)
    (if (good-enough?* guess-new guess-old)
        guess-new
        (try (approx guess-new)
             guess-new)))
  (try 1.0 0.0))
