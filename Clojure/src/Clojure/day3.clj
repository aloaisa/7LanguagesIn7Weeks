;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Language Clojure.
; - Day 3
;      Seven Languages in seven weeks
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ref "Attack of the Clones")
;#<Ref@ffdadcd: "Attack of the Clones">

(def movie (ref "Star Wars"))
;#'user/movie

movie
;#<Ref@579d75ee: "Star Wars">

(deref movie)
;"Star Wars"

@movie
;"Star Wars"

;(alter movie str ": The Empire Strikes Back")
;java.lang.IllegalStateException: No transaction running (NO_SOURCE_FILE:0)

(dosync (alter movie str ": The Empire Strikes Back"))
;"Star Wars: The Empire Strikes Back"

(dosync (ref-set movie "Star Wars: The Revenge of the Sith"))
;"Star Wars: The Revenge of the Sith"

@movie
;"Star Wars: The Revenge of the Sith"

(atom "Split at your own risk.")
;#<Atom@53f64158: "Split at your own risk.">

def danger (atom "Split at your own risk."))
;#'user/danger

danger
;#<Atom@3a56860b: "Split at your own risk.">

@danger
;"Split at your own risk."

(reset! danger "Split with impunity")
;"Split with impunity"

danger
;#<Atom@455fc40c: "Split with impunity">

@danger
;"Split with impunity"

(def top-sellers (atom []))
;#'user/top-sellers

(swap! top-sellers conj {:title "Seven Languages", :author "Tate"})
;[{:title "Seven Languages in Seven Weeks", :author "Tate"}]

(swap! top-sellers conj {:title "Programming Clojure" :author "Halloway"})
;[{:title "Seven Languages in Seven Weeks", :author "Tate"}
;{:title "Programming Clojure", :author "Halloway"}]


;; Working with Agents ;;

(defn twice [x] (* 2 x))
;#'user/twice

(def tribbles (agent 1))
;#'user/tribbles

(send tribbles twice)
;#<Agent@554d7745: 1>

@tribbles
;2

(defn slow-twice [x]
	(do
		(Thread/sleep 5000)
		(* 2 x))
)
;#'user/slow-twice

@tribbles
;2

(send tribbles slow-twice)
;#<Agent@554d7745: 16>

@tribbles
;2

@tribbles
;4

(def finer-things (future (Thread/sleep 5000) "take time"))
;#'user/finer-things

@finer-things
;"take time"


