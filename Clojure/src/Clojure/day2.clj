;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Language Clojure.
; - Day 2
;      Seven Languages in seven weeks
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn size [v]
	(if (empty? v)
		0
		(inc (size (rest v)))
	)
)
	
(size [1 2 3])
; 3


(loop [x 1] x)
; 1


(defn size [v]
	(loop [l v, c 0]
	(if (empty? l)
		c
		(recur (rest l) (inc c)))
	)
)


[1 2 3]
;[1 2 3]

(rest [1 2 3])
;(2 3)

(every? number? [1 2 3 :four])
;false

(some nil? [1 2 nil])
;true

(not-every? odd? [1 3 5])
;false

(not-any? number? [:one :two :three])
;true

(def words ["luke" "chewie" "han" "lando"])
;#'user/words

(filter (fn [word] (> (count word) 4)) words)
;("chewie" "lando")

(map (fn [x] (* x x)) [1 1 2 3 5])
;(1 1 4 9 25)

(def colors ["red" "blue"])
;#'user/colors

(def toys ["block" "car"])
;#'user/toys

(for [x colors] (str "I like " x))
;("I like red" "I like blue")

for [x colors, y toys] (str "I like " x " " y "s"))
;("I like red blocks" "I like red cars"
;"I like blue blocks" "I like blue cars")

(defn small-word? [w] (< (count w) 4))
;#'user/small-word?

(for [x colors, y toys, :when (small-word? y)]
;(str "I like " x " " y "s"))
;("I like red cars" "I like blue cars")

(reduce + [1 2 3 4])
;10

(reduce * [1 2 3 4 5])
;120

(sort [3 1 2 4])
;(1 2 3 4)

(defn abs [x] (if (< x 0) (- x) x))
;#'user/abs

(sort-by abs [-1 -4 3 2])
;(-1 2 3 -4)

(range 1 10)
;(1 2 3 4 5 6 7 8 9)

(range 1 10 3)
;(1 4 7)

(range 10)
;(0 1 2 3 4 5 6 7 8 9)

(take 3 (repeat "Use the Force, Luke"))
;("Use the Force, Luke" "Use the Force, Luke" "Use the Force, Luke")

(take 5 (cycle [:lather :rinse :repeat]))
;(:lather :rinse :repeat :lather :rinse)

(take 5 (drop 2 (cycle [:lather :rinse :repeat])))
;(:repeat :lather :rinse :repeat :lather)

(->> [:lather :rinse :repeat] (cycle) (drop 2) (take 5))
;(:repeat :lather :rinse :repeat :lather)

(take 5 (interpose :and (cycle [:lather :rinse :repeat])))
;(:lather :and :rinse :and :repeat)

(take 20 (interleave (cycle (range 2)) (cycle (range 3))))
;(0 0 1 1 0 2 1 0 0 1 1 2 0 0 1 1 0 2 1 0)

(take 5 (iterate inc 1))
;(1 2 3 4 5)

(take 5 (iterate dec 0))
;(0 -1 -2 -3 -4)

(defn fib-pair [[a b]] [b (+ a b)])
;#'user/fib-pair

(fib-pair [3 5])
;[5 8]

;(iterate fib-pair [1 1])

;(map first (iterate fib-pair [1 1]))

(take 5
	(map
	first
	(iterate fib-pair [1 1])))
;(1 1 2 3 5)

(nth (map first (iterate fib-pair [1 1])) 500)
;225591516161936330872512695036072072046011324913758190588638866418474627738686883405015987052796968498626

(defn factorial [n] (apply * (take n (iterate inc 1))))
;#'user/factorial

(factorial 5)
;120


