#lang racket
(require malt)
; based on code in chapter 1
; date: 24/01/24

; first attempt
; notice order of lambdas
; x is the arg of the outer function
; for a given x, we need to figure out w,b for given values of y
;
; for the function below
; x is argument of the line
; but w (slope) & b (intercept) are parameters of the line
(define line-1
  (lambda (x)
    (lambda (w b)
      (let ((y (+ (* w x) b)))
        y))))

; second attempt - remove intermediate variable y
(define line-2
  (lambda (x)
    (lambda (w b)
      (+ (* w x) b))))

; (line 8) returns a procedure with x=8,
; and has two args w and b
;
; functions that accept parameters after the arguments
; are known as *parameterized functions*
; line-2 is a parameterized function
(display (line-2 8))

(newline)

; apply w and b to the line-2 (x = 8) function
(display ((line-2 8) 4 6))

; Given xs and ys, the parameterized function can
; be used to figure out the values of the w and b
; Once we have figured out w and b,
; then we can use the same function for new values of x
; to get the corresponding values of y.
; As in *predict* y for new values of x.