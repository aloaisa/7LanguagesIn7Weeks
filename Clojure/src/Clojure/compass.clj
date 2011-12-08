;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Language Clojure.
; - Day 2
;      Seven Languages in seven weeks
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defprotocol Compass
  (direction [c])
  (left [c])
  (right [c]))

(def directions [:north :east :south :west])

(defn turn
  [base amount]
  (rem (+ base amount) (count directions)))

(defrecord SimpleCompass [bearing]
  Compass
  (direction [_] (directions bearing))
  (left [_] (SimpleCompass. (turn bearing 3)))
  (right [_] (SimpleCompass. (turn bearing 1)))
  Object
  (toString [this] (str "[" (direction this) "]")))


(turn 1 1)
;2
(turn 3 1)
;0
(turn 2 3)
;1

(def c (SimpleCompass. 0))
;#'user/c

(left c) ; returns a new compass
;#:SimpleCompass{:bearing 3}

c ; original compass unchanged
;#:SimpleCompass{:bearing 0}

(:bearing c)
;0




