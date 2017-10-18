(defsystem "lol"
  :version "0.0.1"
  :author "Eric Bailey <eric@ericb.me>"
  :license "MIT"
  :depends-on (:prove)
  :components ((:module "src"
                :components
                ((:file "guess")
                 (:file "wizard5"))))
  :description "Land of Lisp examples")
