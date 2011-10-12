##########################################
##
## Language Io.
## - Day 3
##      Seven Languages in seven weeks
##
###########################################

######################################################################
#
## 1º) Enhance the XML program to add spaces to show the indentation
#	structure.
#####################################################################
Builder := Object clone
Builder tab := "   "
Builder indentCount := -1

Builder forward := method(

        self indentCount := self indentCount + 1
        writeln(indent(indentCount), "<", call message name, ">")

        call message arguments foreach(
                argument,
                message := self doMessage(argument)
                if(message type == "Sequence",
                        writeln(indent(indentCount + 1), message)
                )
        )

        writeln(indent(indentCount), "</", call message name, ">")
        self indentCount := self indentCount - 1
)

Builder indent := method(
        indentlevel,
        indent := ""
        indentlevel repeat(indent := (tab .. indent) )
        indent 
)

Builder ul(li("Io"), li("Groovy"), li("Ruby"), li("Java"), ul(li("Prolog"), li("Scala"), li("Clojure")));


#################################################################
#
## 2º) Create a list syntax that uses brackets.
#
#################################################################
squareBrackets := method(
	toList := list(); 
	call message arguments foreach(argument, toList append(argument))
)

test := [ "one", "two", "three", "four" ]
test println


#########################################################################
#
## 3º) Enhance the XML program to handle attributes: if the first argu-
#	ment is a map (use the curly brackets syntax), add attributes to
#	the XML program. For example:
#	book({"author": "Tate"}...) would print <book author="Tate">:
#
#########################################################################

OperatorTable addAssignOperator(":" , "atPutProperty" )

curlyBrackets := method(
	
	map := Map clone
	
	call message arguments foreach(argument,
		map doMessage(argument)
	)
	
	map
)

Map atPutProperty := method(
	
	self atPut(
		call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\"" ),
		call evalArgAt(1)
	)
)

Map makeAttr := method(
	self map(attr,val,
	" " .. attr .. "=" .. "\"" .. val .. "\""
	) join
)

Builder := Object clone
Builder tab := "   "
Builder indentCount := -1

Builder forward := method(

	self indentCount := self indentCount + 1
	arguments := call message arguments

	write(indent(indentCount),"<", call message name)

	if(arguments first != nil and arguments first name == "curlyBrackets",
		write (doMessage(arguments first) makeAttr)
		arguments = arguments rest
	)

	writeln (">")

	arguments foreach(
		argument,
		content := doMessage(argument)
		if(content type == "Sequence",
			writeln(indent(indentCount + 1), content)
		)
	)

	writeln(indent(indentCount), "</", call message name, ">")
	self indentCount := self indentCount - 1
)

Builder indent := method(
        indentlevel,
        indent := ""
        indentlevel repeat(indent := (tab .. indent) )
        indent
)

doFile("example-day2.io")

