#lang scheme

;; Define functions for basic arithmetic operations
(define (add a b) (+ a b))
(define (subtract a b) (- a b))
(define (multiply a b) (* a b))
(define (divide a b) (/ a b))

;; Function to evaluate expressions based on operator
(define (calculate op a b)
  (cond
    ((equal? op '+) (add a b))
    ((equal? op '-) (subtract a b))
    ((equal? op '*) (multiply a b))
    ((equal? op '/) (divide a b))
    (else (error "Unsupported operation"))))

;; Main function to handle calculator logic
(define (main)
  (display "Enter an expression (e.g., + 2 3): ")
  (let* ((input (read-line))
         (tokens (string-split input)))
    (if (not (null? tokens))
        (let* ((op (string->symbol (car tokens)))
               (a (string->number (cadr tokens)))
               (b (string->number (caddr tokens))))
          (if (and (number? a) (number? b))
              (begin
                (display "Result: ")
                (display (calculate op a b))
                (newline))
              (display "Invalid input. Please enter valid numbers.")))
        (display "Invalid input. Please enter an expression."))))

;; Run the main function
(main)
