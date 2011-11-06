/*******************************************
**
** Language Scala.
** - Day 3
**      Seven Languages in seven weeks
**
******************************************/

/*
**
** Take the sizer application and add a message to count the number
** of links on the page.
**
*/

import scala.io._
import scala.actors._
import scala.actors.Actor._
 
object PageLoader {
 
	def getContent(url: String) = Source.fromURL(url).mkString
 
	def getPageSize(url: String) = getContent(url).length
 
	def getLinkCount(url: String) = {

		val content = getContent(url)
		"(?i)<a[^>]+?href".r.findAllIn(content).size
	}
}
 
val urls = List("http://www.amazon.com",
		"http://www.twitter.com",
		"http://www.google.com",
		"http://www.cnn.com"
)
 
def getPageDataSequentially() = {
 
	for (url <- urls){
 
		println("Size for " + url + ": " + PageLoader.getPageSize(url))
 
		println("Link count for " + url + ": " + PageLoader.getLinkCount(url))
	}
}
 
def getPageDataConcurrently() = {
 
	val caller = self
 
	for (url <- urls) {
 
		actor {
			caller ! ("Size", url, PageLoader.getPageSize(url))
		}
 
		actor {
			caller ! ("LinkCount", url, PageLoader.getLinkCount(url))
		}
	}
 
	1.to(urls.size * 2).foreach { i =>
 
		receive {
 
			case ("Size", url, size) => {
				println("Size for " + url + ": " + size)
			}
 
			case ("LinkCount", url, count) => {
				println("Link count for " + url + ": " + count)
			}
		}
	}
}
 
println("Sequential run:")
getPageDataSequentially()
 
println()
 
println("Concurrent run:")
getPageDataConcurrently()

///
//Sequential run:
//Size for http://www.amazon.com: 94505
//Link count for http://www.amazon.com: 188
//Size for http://www.twitter.com: 42906
//Link count for http://www.twitter.com: 113
//Size for http://www.google.com: 8734
//Link count for http://www.google.com: 17
//Size for http://www.cnn.com: 101558
//Link count for http://www.cnn.com: 358
//
//Concurrent run:
//Link count for http://www.google.com: 17
//Size for http://www.google.com: 8734
//Link count for http://www.cnn.com: 358
//Size for http://www.cnn.com: 101558
//Link count for http://www.amazon.com: 187
//Size for http://www.amazon.com: 94656
//Link count for http://www.twitter.com: 113
//Size for http://www.twitter.com: 44170

