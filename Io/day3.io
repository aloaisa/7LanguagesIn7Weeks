##########################################
##
## Language Io.
## - Day 3
##      Seven Languages in seven weeks
##
###########################################

##########################################
#
## Domain-Specific Languages
#
#########################################

#{
#	"Bob Smith": "5195551212",
#	"Mary Walsh": "4162223434"
#}

OperatorTable addAssignOperator(":" , "atPutNumber" )
curlyBrackets := method(

	r := Map clone

	call message arguments foreach(arg,
		r doMessage(arg)
	)
	r
)

Map atPutNumber := method(

	self atPut(
		call evalArgAt(0) asMutable removePrefix("\"") removeSuffix(" \"" ),
		call evalArgAt(1)
	)
)

s := File with("phonebook.txt" ) openForReading contents

phoneNumbers := doString(s)
phoneNumbers keys
println
phoneNumbers values println

############################################
#
## method_missing
#
############################################

Builder := Object clone

Builder forward := method(

	writeln("<" , call message name, ">" )

	call message arguments foreach(
		arg,
		content := self doMessage(arg);
		if(content type == "Sequence" , writeln(content)))
		writeln("</" , call message name, ">" )
)

Builder ul(
	li("Io" ),
	li("Lua" ),
	li("JavaScript" )
)

##########################################
#
## Concurrency
#
##########################################
vizzini := Object clone

vizzini talk := method(
	"Fezzik, are there rocks ahead?" println
	yield
	"No more rhymes now, I mean it." println
	yield
)

fezzik := Object clone
fezzik rhyme := method(
	yield
	"If there are, we'll all be dead." println
	yield
	"Anybody want a peanut?" println
)

vizzini @@talk; fezzik @@rhyme
#Coroutine currentCoroutine pause


###########################################
#
## Actors
#
###########################################
slower := Object clone
faster := Object clone

slower start := method(wait(2); writeln("slowly"))

faster start := method(wait(1); writeln("quickly"))

slower start; faster start
slower @@start; faster @@start; wait(3)


###########################################
#
## Futures
#
###########################################
futureResult := URL with("http://google.com/") @fetch

writeln("Do something immediately while fetch goes on in background...")

writeln("This will block until the result is available.")

writeln("fetched ", futureResult size, " bytes")












