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
(double 10)
(cube 10)
(twice sqrt (double 10))
(thrice sqrt (cube 10))
(display "\n")

(define login (lambda (s)
                       (cond
                         [(eq? "Aaron" (car s)) "Welcome back!"]
                         [else "Invalid user"])))
(login '("Aaron" "Tsang"))
(login '("AaroN" "Tsang"))
(login '("John" "Smith"))
(display "\n")

(define (make-adder a) (lambda (b) (+ b a)))
(define (make-subtract s) (lambda (t) (- t s)))
(let ([2add (make-adder 2)]
      [10add (make-adder 10)])
  (print (2add 4))
  (display "\n")
  (print (10add 100)))
(display "\n")

(let ([2minus (make-subtract 2)]
      [10minus (make-subtract 10)])
  (print (2minus 4))
  (display "\n")
  (print (10minus 100)))
(display "\n")
(display "\n")

(define (multiply x y) (* x y))
((curry multiply) 2)
(((curry multiply) 2) 3)
(display "\n")

((curry list) 1 2)
((curry list) 1)
(((curry list) 1 2) 3)
(((curry list) '(1 2 3)) '(4 5 6) '(7 8 9))
((curry list) '(1 2 3) '(4 5 6))

(((curry list) 1) 2 3)
(display "\n")

(map (curry - 10) '(2 4 6))
(map (curry + 10) '(3 6 9))
(display "\n")

(define foo (curry (lambda (x y z) (list x y z))))
(foo 1 2 3)
(display "\n")

(define (arge p) (map p '(2 4 6 8)))
(arge (curry - 10))
(arge (curry + 10))
(arge (curry + 4))
(arge (curry - 2))
(display "\n")

(define (cuber c) (cube c))
(cuber 2)
(thrice sqrt (cuber 2))
(cuber 10)
(thrice sqrt (cuber 10))
(display "\n")

(define (doubler d) (double d))
(doubler 3)
(twice sqrt (doubler 3))
(doubler 10)
(twice sqrt (doubler 10))
