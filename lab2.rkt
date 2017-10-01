#lang racket
(define (twice f v)
  (f (f v)))
(define (thrice f v)
  (f (f (f v))))
(define double (lambda (x)
                 (*
                  (* x x)
                  (* x x)
                  )))
(define cube (lambda (x)
               (*
                (* (* x x) (* x x))
                (* (* x x) (* x x))
                )))
(define login (lambda (s)
                       (cond
                         [(eq? "Aaron" (car s)) "Welcome back!"]
                         [else "Invalid user"])))