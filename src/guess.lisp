(in-package :cl-user)
(defpackage lol.guess
  (:use :cl :prove)
  (:export :bigger
           :smaller
           :start-over))
(in-package :lol.guess)


(defparameter *small* 1)
(defparameter *big* 100)


(defun guess-my-number ()
  (ash (+ *small* *big*) -1))


(defun smaller ()
  (setf *big* (1- (guess-my-number)))
  (guess-my-number))


(defun bigger ()
  (setq *small* (1+ (guess-my-number)))
  (guess-my-number))


(defun start-over ()
  (defparameter *small* 1)
  (defparameter *big* 100)
  (guess-my-number))
