; date: 31/01/24
; tensor-sum: based on tensor intro in Chapter 2

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

(define (sum-1 t)
    (summed t (sub1 (tensor-length t)) 0.0))

(define (summed t i a)
    (cond
        ((zero? i) (+ (tensor-ref t 0) a))
        (else
            (summed t (sub1 i) (+ (tensor-ref t 1) a)))))

(display (sum-1 (tensor 10.0 12.0 14.0)))
(newline)