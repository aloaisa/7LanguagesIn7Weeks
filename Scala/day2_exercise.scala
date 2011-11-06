/*******************************************
**
** Language Scala.
** - Day 1
**      Seven Languages in seven weeks
**
******************************************/

/*
** Use foldLeft to compute the total size of a list of strings.
*/

val books = List(
	"Clean Code",
	"Tú Puedes",
	"Version control by Example",
	"Buen Jefe, Mal Jefe"
)
 
val charLength = (0 /: books){ (sum, books) =>
	(sum + books.size)
}
 
println("Total Length: " + charLength)
 

val charLength2 = books.foldLeft(0)((sum, books) =>
	(sum + books.size)
)

println("Total Length: " + charLength2)



/*
**
** Write a Censor trait with a method that will replace the curse words
**  Shoot and Darn with Pucky and Beans alternatives. Use a map to
**  store the curse words and their alternatives.
**
*/

trait Censor {
 
	val wordsToCensored = Map(
		"Shoot" -> "Pucky",
		"Darn" -> "Beans"
	)
 
	def censor(text: String) = {

		wordsToCensored.foldLeft(text)((censoredText, mapping) =>
 
				censoredText.replaceAll(
					("(?i)\\b" + mapping._1 + "\\b"),
					mapping._2
				)
		)
	}
}
 
 
class Text(val text: String) extends Censor {
	def getText() = this.text
	def getCensoredText() = this.censor(this.getText)
}
 
val text = new Text(
	"Darn, shoot, and heck are all interjections, mild expressions " +
	"of surprise or dismay. Heck is a cleaner version of hell, darn" +
	"a more polite version of damn, and shoot is a more innocuous " +
	"version of shit."
)

println("\n") 
println("Original Text: ")
println(text.getText)

println("Censored Text: ")
println(text.getCensoredText)


/*
**
** Load the curse words and alternatives from a file.
**
*/

class Censor2(val filePath: String) {
 
	val file = io.Source.fromFile(filePath)
	var wordsToCensored = Map[String, String]()
 
	wordsToCensored = file.getLines.foldLeft(wordsToCensored) {
 
		(mappings, data) =>
			val terms = data.split( "#" )
			(mappings + (terms(0) -> terms(1)))
 
	}
 
	def doCensor(text: String) = {
 
		wordsToCensored.foldLeft(text)((censoredText, mapping) =>
 
				censoredText.replaceAll(
					("(?i)\\b" + mapping._1 + "\\b"),
					mapping._2
				)
		)
	}
}

class Text2(val text: String, val censor2: Censor2) {
        def getText() = this.text
        def getCensoredText() = this.censor2.doCensor(this.getText)
}
 
val text2 = new Text2(
        "Darn, shoot, and heck are all interjections, mild expressions " +
        "of surprise or dismay. Heck is a cleaner version of hell, darn" +
        "a more polite version of damn, and shoot is a more innocuous " +
        "version of shit.",
 
	new Censor2("./Words.txt")
)
 
println("\n")
println("From a File:")

println("Original Text: ")
println(text2.getText)

println("Censored Text: ")
println(text2.getCensoredText)


