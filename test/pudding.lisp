(in-package :lol.pudding)


(plan 3)


(subtest "Useless old Johnny"
  (is (pudding-eater 'johnny)
      '(I HOPE YOU CHOKED ON MY PUDDING JOHNNY)
      "I hope you choked on my pudding, Johnny!")
  (is *arch-enemy*
      'USELESS-OLD-JOHNNY
      "Useless old Johnny!"))


(subtest "George Clooney"
  (is (pudding-eater 'george-clooney)
      '(WHY YOU EAT MY PUDDING STRANGER ?)))


(subtest "Stupid Lisp Alien"
  (is (pudding-eater 'henry)
      '(CURSE YOU LISP ALIEN - YOU ATE MY PUDDING)))


(finalize)
