;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Language Clojure.
; - Day 3
;      Seven Languages in seven weeks
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Use refs to create a vector of accounts in memory. Create debit ;;;;
;;;  and credit functions to change the balance of an account.      ;;;;

(def accounts (ref []))

(defn
	credit
	[accounts number ammount]
		(map
		(fn
		[account]
 
			(if (= number (:account account))
 
				(assoc account :balance (+ (:balance account) ammount))
 
				account
			)
		)
		
		accounts
		)
)
 
(defn
	debit
	[accounts number ammount]
 	(credit accounts number (- ammount))
)
 
(dosync
	(alter accounts
		conj
		{
			:account "768"
			:balance 35
		}
		{
			:account "537"
			:balance 10
		}
		{
			:account "5345"
			:balance 44
		}
	)
)
 
(dosync
	(alter
	accounts
		credit "537" 10
	)
 
	(alter
	accounts
		debit "768" 65
	)
)
 
(println @accounts)



;;;
;;; In this section, I’m going to outline a single problem called sleeping
;;; barber. It was created by Edsger Dijkstra in 1965. It has these charac-
;;; teristics:
;;;	 • A barber shop takes customers.
;;;	 • Customers arrive at random intervals, from ten to thirty millisec-
;;; onds.
;;;	 • The barber shop has three chairs in the waiting room.
;;;	 • The barber shop has one barber and one barber chair.
;;;	 • When the barber’s chair is empty, a customer sits in the chair,
;;; wakes up the barber, and gets a haircut.
;;;	 • If the chairs are occupied, all new customers will turn away.
;;;	 • Haircuts take twenty milliseconds.
;;;	 • After a customer receives a haircut, he gets up and leaves.
;;; Write a multithreaded program to determine how many haircuts a bar-
;;; ber can give in ten seconds.
;;;

(def clients (ref clojure.lang.PersistentQueue/EMPTY))

(def counter (atom 0))

(def running? (atom true))

(def seats 5)

(def seconds 10)



(defn cut [client]
	(println "Cutting" client)
	(Thread/sleep 20)
	(swap! counter inc))


(defn nextClient []
	(dosync
		(let [client (peek @clients)]
			(if-not (nil? client)
			(alter clients pop))
			client)
	)
)


(defn barber []
	(let [client (nextClient)]
		(if-not (nil? client)
			(cut client)
			(Thread/sleep 50)))
	(if @running? (recur))
)


(defn addClient [client]
	(dosync
		(if (< (count @clients) seats)
		(do (println client "Sitting")
			(alter clients conj client))
		
			(println client "Next turn")
		)
	)
)


(defn shop [count]
	(Thread/sleep (+ 10 (rand-int 20)))
	(if @running?
		(do (addClient (str "client " count))
			(recur (inc count))
		)
	)
)


(.start (Thread. barber))

(.start (Thread. #(shop 0)))

(Thread/sleep (* 1000 seconds))

(swap! running? not)

(println @counter "Cuts in" seconds "seconds")

