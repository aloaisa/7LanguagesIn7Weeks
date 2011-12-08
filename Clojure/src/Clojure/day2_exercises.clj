;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Language Clojure.
; - Day 2
;      Seven Languages in seven weeks
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Implement an unless with an else condition using macros.

(defmacro
	unless
	[test ifBody elseBody]
	`(if
		(not ~test)
		~ifBody
		~elseBody
	)
)
 
 
(unless
	true
	(println "The if condition.")
	(println "The else condition.")
)
 
 
(unless
	false
	(println "The if condition.")
	(println "The else condition.")
)


;;; Write a type using defrecord that implements a protocol.

(defprotocol Human 
	(talk [this name])
	(speech [this])
)
 
(defrecord Person
 	[name]
	Human
	(talk
	[this name]
		(str "Hello " name ", my name is " (:name this))
	)
 
	(speech
	[this]
		(rand-nth
			'(
				"Hi."
				"How are you?"
				"It's a nice day today, isn't it?"
			)
		)
	)
)
 
 
(def sonia (Person. "Sonia"))

(println (talk sonia "Alvaro"))
(println (speech sonia))




