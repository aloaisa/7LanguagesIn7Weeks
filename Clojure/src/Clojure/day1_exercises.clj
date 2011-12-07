/*********************************
* Language Clojure.
* - Day 1
*      Seven Languages in seven weeks
*
********************************/

// Implement a function called (big st n) that returns true if a string st
//	is longer than n characters.

(defn
iprintln (big "example" 0))
	big
	[st n]
	(> (count st) n)
)
 
(println (big "example" 3))
//true
//nil

(println (big "example" 7))
//false
//nil

(println (big "example" 8))
//false
//nil

(println (big "example" 0))
//true
//nil
 


// Write a function called (collection-type col) that returns :list, :map,
//	or :vector based on the type of collection col.


(defn
	collection-type
	[col]
	(cond
		(list? col) :list
		(map? col) :map
		(vector? col) :vector
	)
)
 
(def myList '(1 2 3 4 5 6))
//#'user/myList

(def myMap {:a 1, :b 2, :c 3, :d 4, :e 5, :f 6})
//#'user/myMap

(def myVector [1 2 3 4 5 6])
//#'user/myVector
 
(println (collection-type myList))
//:list
//nil

(println (collection-type myMap))
//:map
//nil

(println (collection-type myVector))
//:vector
//nil
