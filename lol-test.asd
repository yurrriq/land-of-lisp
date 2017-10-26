(defsystem "lol-test"
  :version "0.2.1"
  :author "Eric Bailey <eric@ericb.me>"
  :license "WTFPL"
  :depends-on (:lol
               :prove
               :sb-cover)
  :serial t
  :components ((:module "test"
                :serial t
                :components
                ((:test-file "guess")
                 (:test-file "pudding")
                 (:test-file "wizard5"))))

  :defsystem-depends-on ("prove-asdf")
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run) :prove) c)))
