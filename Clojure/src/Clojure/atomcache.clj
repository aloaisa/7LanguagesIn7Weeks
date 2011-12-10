;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Language Clojure.
; - Day 3
;      Seven Languages in seven weeks
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns solutions.atom-cache
  (:refer-clojure :exclude [get])
)

(defn create
  []
  (atom {})
)

(defn get
  [cache key]
  (@cache key)
)

(defn put
  ([cache value-map]
     (swap! cache merge value-map))
  ([cache key value]
     (swap! cache assoc key value))
)

(def ac (create))

(put ac :quote "I'm your father, Luke.")

(println (str "Cached item: " (get ac :quote)))
;Cached item: I'm your father, Luke.
