(in-package :lol.graphviz)


(plan 1)


(subtest "Converting Node Identifiers"
  (is (dot-name 'living-room)
      "LIVING_ROOM")
  (is (dot-name 'foo!)
      "FOO_")
  (is (dot-name '24)
      "24"))


(finalize)
