;;; foo.scm

; The declaration marks this source file as dependant on the symbols provided
; by the bar unit:
(declare (uses bar))

;;(write (fac 10))
;;(newline)

(printf "This is so Awesome!!!!")

(newline)

(printf "Add 1 to 19: ~a~%" (add1 19))

(newline)

(printf "Factorial of 124 is: ~a~%" (fac 124))

