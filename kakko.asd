#|
  This file is a part of kakko project.
  Copyright (c) 2015 Go Saito (go@paravirt.org)
|#

#|
  Author: Go Saito (go@paravirt.org)
|#

(in-package :cl-user)
(defpackage kakko-asd
  (:use :cl :asdf))
(in-package :kakko-asd)

(defsystem kakko
  :version "0.1"
  :author "Go Saito"
  :license "MIT"
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "kakko"))))
  :description ""
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op kakko-test))))
