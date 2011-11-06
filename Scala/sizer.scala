/*******************************************
**
** Language Scala.
** - Day 3
**      Seven Languages in seven weeks
**
******************************************/
import scala.io._
import scala.actors._
import Actor._

object PageLoader {
	def getPageSize(url : String) = Source.fromURL(url).mkString.length
}

val urls = List("http://www.amazon.com/" ,
		"http://www.twitter.com/" ,
		"http://www.google.com/" ,
		"http://www.cnn.com/" )

def timeMethod(method: () => Unit) = {

	val start = System.nanoTime
	method()
	val end = System.nanoTime

	println("Method took " + (end - start)/1000000000.0 + " seconds." )
}

def getPageSizeSequentially() = {
	for(url <- urls) {
		println("Size for " + url + ": " + PageLoader.getPageSize(url))
	}
}

def getPageSizeConcurrently() = {

	val caller = self

	for(url <- urls) {
		actor { caller ! (url, PageLoader.getPageSize(url)) }
	}

	for(i <- 1 to urls.size) {
		receive {
			case (url, size) =>
				println("Size for " + url + ": " + size)
		}
	}
}

println("Sequential run:" )
timeMethod { getPageSizeSequentially }

println("Concurrent run" )
timeMethod { getPageSizeConcurrently }

///
//Sequential run:
//Size for http://www.amazon.com/: 102046
//Size for http://www.twitter.com/: 40050
//Size for http://www.google.com/: 11006
//Size for http://www.cnn.com/: 85158
//Method took 5.046201754 seconds.
//Concurrent run
//Size for http://www.google.com/: 11030
//Size for http://www.amazon.com/: 95422
//Size for http://www.cnn.com/: 85158
//Size for http://www.twitter.com/: 40033
//Method took 1.22984843 seconds.

