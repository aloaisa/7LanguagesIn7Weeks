/*******************************************
**
** Language Scala.
** - Day 1
**      Seven Languages in seven weeks
**
******************************************/

class Person(first_name: String) {

	println("Outer constructor" )

	def this(first_name: String, last_name: String) {
		this(first_name)
		println("Inner constructor" )
	}

	def talk() = println("Hi" )
}

val bob = new Person("Bob" )
val bobTate = new Person("Bob" , "Tate" )

