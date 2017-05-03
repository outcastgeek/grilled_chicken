;;; embedded.scm

(declare (unit embedded))

;;(require-extension nrepl)
;;(declare (uses nrepl))

(define (start-repl port)
  (nrepl port
         (lambda (in out)
           (thread-start! ;; otherwise accept-loop will be blocked
            (lambda ()
              (display ";; please enter an accept token: " out)
              (define token (read-line in))
              (if (equal? token "abc")
                  (nrepl-loop in out)
                  (begin (display ";; access denied\n" out)
                         (close-input-port in)
                         (close-output-port out)
                         ))
              ))
           )))



