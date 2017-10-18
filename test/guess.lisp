(in-package :lol.guess)


(plan 1)


(subtest "A Plausible Session"
  (is (start-over) 50 "(start-over) ; => 50")
  (is (smaller)    25 "(smaller)    ; => 25")
  (is (bigger)     37 "(bigger)     ; => 37")
  (is (bigger)     43 "(bigger)     ; => 43")
  (is (smaller)    40 "(smaller)    ; => 40")
  (is (bigger)     41 "(bigger)     ; => 41")
  (is (bigger)     42 "(bigger)     ; => 42"))


(finalize)
