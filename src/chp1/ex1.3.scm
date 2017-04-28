;; Exercise 1.3

(define (sum-of-squares-of-two-largest x y z)
  (cond ((>= x y) (+ (* x x)
                     (cond ((>= y z) (* y y))
                           ((> z y) (* z z)))
                     ))
        ((> y x) (+ (* y y)
                    (cond ((>= x z) (* x x))
                          ((> z x) (* z z)))
                    ))
        ))

(sum-of-squares-of-two-largest 1 2 3)

(sum-of-squares-of-two-largest 2 1 3)

(sum-of-squares-of-two-largest 2 3 1)

(sum-of-squares-of-two-largest 3 1 2)

(sum-of-squares-of-two-largest 3 2 1)

(sum-of-squares-of-two-largest 2 3 3)

(sum-of-squares-of-two-largest 3 3 2)

(sum-of-squares-of-two-largest 3 2 3)

(sum-of-squares-of-two-largest 3 3 3)

