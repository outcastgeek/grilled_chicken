;;; bar.scm

; The declaration marks this source file as the bar unit. The names of the
; units and your files don't need to match

(declare (unit bar))

(define (fac n)
  (if (zero? n)
      1
      (* n (fac (- n 1)))
      ))

(define (add1 n)
  (+ n 1))

(define (fact x)

  (define (iter n accum)
    (if (zero? n)
        accum
        (iter (- n 1) (* n accum))))
  (iter x 1))

(fact 5)

