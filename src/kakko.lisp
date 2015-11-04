(in-package :cl-user)
(defpackage kakko
  (:use :cl)
  (:export :write-kakko
           :read-kakko
           :eval-kakko))
(in-package :kakko)

(defun flatten-nil (ls)
  (cond ((atom ls) (list ls))
        (t (mapcan #'flatten-nil ls))))

(defun make-n (n)
  (loop repeat n collect nil))

(defun make-kakko (src)
  (let* ((lst (coerce src 'list))
         (kakko (mapcar #'(lambda (x)
                            (make-n (char-code x)))
                        lst)))
    kakko))

(defun print-kakko (kakko)
  (cond ((atom kakko) (format t "()"))
        ((listp kakko) (progn
                         (format t "(")
                         (mapc #'print-kakko kakko)
                         (format t ")")))
        (t (error "???"))))

(defun print-kakko-string (kakko)
  (with-output-to-string (*standard-output*)
    (print-kakko kakko)))

(defun write-kakko (str)
  (print-kakko-string (make-kakko str)))

(defun read-kakko (str)
  (let* ((kakko (read-from-string str))
         (lst (mapcar #'(lambda (x)
                          (code-char (length x)))
                      kakko))
         (prog (coerce lst 'string)))
    (read-from-string prog)))

(defun eval-kakko (str)
  (eval (read-kakko str)))
