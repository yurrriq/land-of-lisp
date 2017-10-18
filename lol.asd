(defsystem "lol"
  :version "0.1.1"
  :author "Eric Bailey <eric@ericb.me>"
  :license "WTFPL"
  :depends-on (:prove)
  :components ((:module "src"
                :components
                ((:file "guess")
                 (:file "pudding")
                 (:file "wizard5"))))
  :description "Land of Lisp examples")
