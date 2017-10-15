;;;; lol.asd

(asdf:defsystem #:lol
  :description "Land of Lisp examples"
  :author "Eric Bailey <eric@ericb.me>"
  ;; TODO :license "Specify license here"
  :depends-on (#:lisp-unit)
  :serial t
  :components ((:module "src"
                :serial t
                :components
                ((:file "wizard5")))))

(defpackage #:lol
  (:use #:cl))
(in-package #:lol)
