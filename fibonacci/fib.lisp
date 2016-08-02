(defun fib (n)
  (if (< n 2)
      n
      (+ (fib (- n 1))
         (fib (- n 2)))))

(defun fast-fib (n)
    (fib-iter 1 0 n))

(defun fib-iter (a b count)
  (if (= count 1)
      a
      (fib-iter (+ a b) a (- count 1))))
