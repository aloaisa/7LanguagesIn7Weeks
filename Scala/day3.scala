/*******************************************
**
** Language Scala.
** - Day 3
**      Seven Languages in seven weeks
**
******************************************/


val movies =
	<movies>
		<movie genre="action">Pirates of the Caribbean</movie>
		<movie genre="fairytale">Edward Scissorhands</movie>
	</movies>

//movies: scala.xml.Elem = 
//<movies>
//                       <movie genre="action">Pirates of the Caribbean</movie>
//                       <movie genre="fairytale">Edward Scissorhands</movie>
//               </movies>


movies.text
//res0: String = 
//
//                       Pirates of the Caribbean
//                       Edward Scissorhands

val movieNodes = movies \ "movie"
//movieNodes: scala.xml.NodeSeq = <movie genre="action">Pirates of the Caribbean</movie><movie genre="fairytale">Edward Scissorhands</movie>


movieNodes(0)
//res1: scala.xml.Node = <movie genre="action">Pirates of the Caribbean</movie>


movieNodes(0) \ "@genre"
//res2: scala.xml.NodeSeq = action

////
def doChore(chore: String): String = chore match {
	case "clean dishes" => "scrub, dry"
	case "cook dinner" => "chop, sizzle"
	case _ => "whine, complain"
}

println(doChore("clean dishes" ))
println(doChore("mow lawn" ))

//scala day3.scala
//scrub, dry
//whine, complain

def factorial(n: Int): Int = n match {
	case 0 => 1
	case x if x > 0 => factorial(n - 1) * n
}

println()
println("Factorial 3: ")
println(factorial(3))
println("Factorial 0: ")
println(factorial(0))
//
//Factorial 3: 
//6
//Factorial 0: 
//1

val reg = """^(F|f)\w*""".r
//reg: scala.util.matching.Regex = ^(F|f)\w*

println(reg.findFirstIn("Fantastic"))
//Some(Fantastic)

println(reg.findFirstIn("not Fantastic"))
//None

val reg2 = "the".r
//reg: scala.util.matching.Regex = the

reg2.findAllIn("the way the scissors trim the hair and the shrubs")
//res6: scala.util.matching.Regex.MatchIterator = non-empty iterator


/////
val movies2 = <movies>
	<movie>The Incredibles</movie>
	<movie>WALL E</movie>
	<short>Jack Jack Attack</short>
	<short>Geri's Game</short>
</movies>

println("\n\n")

(movies2 \ "_" ).foreach { movie =>
	movie match {
		case <movie>{movieName}</movie> => println(movieName)
		case <short>{shortName}</short> => println(shortName + " (short)" )
	}
}
//
//The Incredibles
//WALL E
//Jack Jack Attack (short)
//Geri's Game (short)


