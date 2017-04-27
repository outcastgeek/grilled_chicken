;;;; code.scm

;; 1.1.1 Expressions

(display 486)

(+ 137 349)

(- 1000 334)

(* 5 99)

(/ 10 5)

(+ 2.7 10)

(+ 21 35 12 7)

(* 25 4 12)

(+ (* 3 5) (- 10 6))

(+ (* 3 (+ (* 2 4) (+ 3 5))) (+ (- 10 7) 6))

(+ (* 3
      (+ (* 2 4)
         (+ 3 5)))
   (+ (- 10 7)
      6))

;; 1.1.2 Naming and the Environment

(define size 2)

(display size)

(define pi 3.14159)
(define radius 10)

(* pi (* radius radius))

(define circumference (* 2 pi radius))

(display circumference)


;; 1.1.3 Evaluating Combinations

(* (+ 2 (* 4 6)) (+ 3 5 7))

;; 1.1.4 Compound Procedures

(define (square x) (* x x))

(square 21)

(square (+ 2 5))

(square (square 3))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(sum-of-squares 3 4)

(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))

(f 5)

;; 1.1.5 The Substitution Model for Procedure Application

;; 1.1.6 Conditional Expressions and Predicates

(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))

(abs -15)

(define (abs x)
  (cond ((< x 0) (- x))
        (else x)))

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (>= x y)
  (or (> x y) (= x y)))

(define (>= x y)
  (not (< x y)))

;; Exercise 1.1

(display 10)

(+ 5 3 4)

(- 9 1)

(/ 6 2)

(+ (* 2 4) (- 4 6))

(define a 3)

(define b (+ a 1))

(+ a b (* a b))

(= a b)

(if (and (> b a) (< b (* a b)))
    b a)

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))

(+ 2 (if (> b a) b a))

(* (cond ((> a b) a) ((< a b) b)
         (else -1)) (+ a 1))


