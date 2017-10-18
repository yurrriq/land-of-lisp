(in-package :lol.pudding)


(plan 1)


(subtest "A Plausible Session"
  (is (pudding-eater 'johnny)
      '(I HOPE YOU CHOKED ON MY PUDDING JOHNNY)
      "I hope you choked on my pudding, Johnny!")
  (is *arch-enemy*
      'USELESS-OLD-JOHNNY
      "Useless old Johnny!")
  (is (pudding-eater 'george-clooney)
      '(WHY YOU EAT MY PUDDING STRANGER ?)))


(finalize)
