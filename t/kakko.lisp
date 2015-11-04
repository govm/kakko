(in-package :cl-user)
(defpackage kakko-test
  (:use :cl
        :kakko
        :prove))
(in-package :kakko-test)

;; NOTE: To run this test file, execute `(asdf:test-system :kakko)' in your Lisp.

(plan nil)

(is (kakko:eval-kakko (kakko:write-kakko ":kakko")) :kakko)
(is-print (kakko:eval-kakko (kakko:write-kakko "(let ((a \"hoge\"))
                                                  (princ a))"))
          "hoge")
(is (kakko:eval-kakko "((()()()()()()()()()()()()()()()()()()()()()()()()()()
                       ()()()()()()()()()()()()()()()()()()()()()()()))") 1)

(finalize)
