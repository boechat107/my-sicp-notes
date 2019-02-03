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
  (try 1 x))
