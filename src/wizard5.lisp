(in-package #:lol)
(defpackage #:lol.wizard5
  (:use #:cl #:lisp-unit)
  (:export #:look
           #:walk
           #:pickup))
(in-package #:lol.wizard5)


(defparameter *nodes*
  '((living-room (you are in the living room.
                  a wizard is snoring loudly on the couch.))
    (garden      (you are in a beautiful garden.
                  there is a well in front of you.))
    (attic       (you are in the attic.
                  there is a giant welding torch in the corner.))))

(defparameter *edges*
  '((living-room (garden west door)
                 (attic upstairs ladder))
    (garden      (living-room east door))
    (attic       (living-room downstairs ladder))))

(defparameter *objects* '(whiskey bucket frog chain))

(defparameter *object-locations*
  '((whiskey living-room)
    (bucket living-room)
    (chain garden)
    (frog garden)))

(defparameter *location* 'living-room)


(defun describe-location (location nodes)
  (cadr (assoc location nodes)))


(defun describe-path (edge)
  `(there is a ,(caddr edge) going ,(cadr edge) from here.))


(defun describe-paths (location edges)
  (apply #'append (mapcar #'describe-path (cdr (assoc location edges)))))


(defun objects-at (loc objs obj-locs)
  (labels ((at-loc-p (obj)
             (eq (cadr (assoc obj obj-locs)) loc)))
    (remove-if-not #'at-loc-p objs)))


(defun describe-objects (loc objs obj-loc)
  (labels ((describe-obj (obj)
             `(you see a ,obj on the floor.)))
    (apply #'append
           (mapcar #'describe-obj
                   (objects-at loc objs obj-loc)))))


(defun look ()
  (append (describe-location *location* *nodes*)
          (describe-paths *location* *edges*)
          (describe-objects *location* *objects* *object-locations*)))


(defun walk (direction)
  (let ((next (find direction
                    (cdr (assoc *location* *edges*))
                    :key #'cadr)))
    (if next
        (progn (setf *location* (car next))
               (look))
        '(you cannot go that way.))))


(defun pickup (object)
  (if (member object (objects-at *location* *objects* *object-locations*))
      (progn (push (list object 'body) *object-locations*)
             `(you are now carrying the ,object))
      '(you cannot get that)))


(defun inventory ()
  (cons 'items- (objects-at 'body *objects* *object-locations*)))


(define-test describe-living-room
  (assert-equal '(you are in the living room.
                  a wizard is snoring loudly on the couch.)
                (describe-location 'living-room *nodes*)))


(define-test garden-path
  (assert-equal '(THERE IS A DOOR GOING WEST FROM HERE.)
                (describe-path '(garden west door))))


(define-test living-room-paths
  (assert-equal '(THERE IS A DOOR GOING WEST FROM HERE.
                  THERE IS A LADDER GOING UPSTAIRS FROM HERE.)
                (describe-paths 'living-room *edges*)))
(define-test living-room-objects
  (assert-equal '(WHISKEY BUCKET)
                (objects-at 'living-room *objects* *object-locations*)))


(define-test describe-living-room-objects
  (assert-equal '(YOU SEE A WHISKEY ON THE FLOOR.
                  YOU SEE A BUCKET ON THE FLOOR.)
                 (describe-objects 'living-room *objects* *object-locations*)))


(define-test look
  (assert-equal '(you are in the living room.
                  a wizard is snoring loudly on the couch.
                  THERE IS A DOOR GOING WEST FROM HERE.
                  THERE IS A LADDER GOING UPSTAIRS FROM HERE.
                  YOU SEE A WHISKEY ON THE FLOOR.
                  YOU SEE A BUCKET ON THE FLOOR.)
                 (look)))


(define-test pickup-whiskey
  (assert-equal '(YOU ARE NOW CARRYING THE WHISKEY)
                (pickup 'whiskey)))


(define-test have-whiskey
  (assert-equal '(ITEMS- WHISKEY)
                (inventory)))
