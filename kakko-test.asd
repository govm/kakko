#|
  This file is a part of kakko project.
  Copyright (c) 2015 Go Saito (go@paravirt.org)
|#

(in-package :cl-user)
(defpackage kakko-test-asd
  (:use :cl :asdf))
(in-package :kakko-test-asd)

(defsystem kakko-test
  :author "Go Saito"
  :license "MIT"
  :depends-on (:kakko
               :prove)
  :components ((:module "t"
                :components
                ((:test-file "kakko"))))
  :description "Test system for kakko"

  :defsystem-depends-on (:prove-asdf)
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run-test-system) :prove-asdf) c)
                    (asdf:clear-system c)))
