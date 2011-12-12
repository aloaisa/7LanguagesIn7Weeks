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

