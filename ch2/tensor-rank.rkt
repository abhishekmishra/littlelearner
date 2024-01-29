; date: 26/01/24
; tensor-rank: based on tensor intro in Chapter 2

#lang racket
(require malt)

; my implementations of using the appendix
; for the tensor meta-language
; TODO: move to separate module for reuse.

(define (tensor . args)
    (apply vector args))

(define scalar?
  (lambda (x)
    (not (vector? x))))

; test scalar?
(display (scalar? 10))
(newline)

(display (scalar? (tensor 1 2 3)))
(newline)

(define (tensor-ref t i)
    (vector-ref t i))

(define temp1 (tensor 1 2 3))
(display temp1)
(newline)
(display (tensor-ref temp1 2))
(newline)

(define (tensor-length t)
  (vector-length t))

; first attempt at rank (from pg 59 of book)
; a recursive implementation to get the rank of the tensor
(define rank-0
  (lambda (t)
    (cond
      ; base case to check if tensor is a scalar
      ((scalar? t) 0)
      ; recursive case to add 1 to rank of first element of the tensor
      (else (add1 (rank-0 (tensor-ref t 0)))))))

(display (rank-0 '(((8) (9)) ((4) (7)))))
(newline)

; shape of a tensor
(define shape
  (lambda (t)
    (cond
      ((scalar? t) (list))
      (else (cons (tensor-length t) (shape (tensor-ref t 0)))))))

(display (shape 0))
(newline)

(display (shape (tensor 0)))
(newline)

; second attempt at rank (from pg 67 of book)
; uses an accumulator design
(define (rank t)
    (ranked t 0))

(define (ranked t a)
  (cond
    ((scalar? t) a)
    (else (ranked (tensor-ref t 0) (add1 a)))))

(display (rank (tensor (tensor (tensor 8) (tensor 9)) (tensor (tensor 4) (tensor 7)))))
(newline)