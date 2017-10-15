(in-package :lol.wizard5)


(prove:plan 2)


(prove:subtest "lol.wizard5 (Private Parts)"
  (prove:is (describe-location 'living-room *nodes*)
            '(you are in the living room.
              a wizard is snoring loudly on the couch.))
  (prove:is (describe-path '(garden west door))
            '(THERE IS A DOOR GOING WEST FROM HERE.))
  (prove:is (describe-paths 'living-room *edges*)
            '(THERE IS A DOOR GOING WEST FROM HERE.
              THERE IS A LADDER GOING UPSTAIRS FROM HERE.))
  (prove:is (describe-objects 'living-room *objects* *object-locations*)
            '(YOU SEE A WHISKEY ON THE FLOOR.
              YOU SEE A BUCKET ON THE FLOOR.))
  (prove:is (objects-at 'living-room *objects* *object-locations*)
            '(WHISKEY BUCKET)))




(prove:subtest "lol.wizard5 (Public API)"
  (prove:is (look)
            '(you are in the living room.
              a wizard is snoring loudly on the couch.
              THERE IS A DOOR GOING WEST FROM HERE.
              THERE IS A LADDER GOING UPSTAIRS FROM HERE.
              YOU SEE A WHISKEY ON THE FLOOR.
              YOU SEE A BUCKET ON THE FLOOR.))
  (prove:subtest "Pick up the whiskey"
    (prove:is (pickup 'whiskey)
              '(YOU ARE NOW CARRYING THE WHISKEY))
    (prove:is (objects-at 'living-room *objects* *object-locations*)
              '(BUCKET))
    (prove:is (describe-objects 'living-room *objects* *object-locations*)
              '(YOU SEE A BUCKET ON THE FLOOR.)))
  (prove:is (pickup 'the-pace)
            '(you cannot get that.))
  (prove:is (walk 'west)
            '(you are in a beautiful garden.
              there is a well in front of you.
              THERE IS A DOOR GOING EAST FROM HERE.
              YOU SEE A FROG ON THE FLOOR.
              YOU SEE A CHAIN ON THE FLOOR.))
  (prove:is (walk 'south)
            '(you cannot go that way.))
  (prove:is (inventory)
            '(ITEMS- WHISKEY)))




(prove:finalize)
