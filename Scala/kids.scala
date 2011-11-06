/*******************************************
**
** Language Scala.
** - Day 3
**      Seven Languages in seven weeks
**
******************************************/

import scala.actors._
import scala.actors.Actor._

case object Poke
case object Feed

class Kid() extends Actor {
	def act() {
		loop {
			react {
				case Poke => {
					println("Ow..." )
					println("Quit it..." )
				}
			
				case Feed => {
					println("Gurgle..." )
					println("Burp..." )
				}
			}
		}
	}
}


val bart = new Kid().start
val lisa = new Kid().start

println("Ready to poke and feed..." )

bart ! Poke
lisa ! Poke
bart ! Feed
lisa ! Feed

///
//Ready to poke and feed...
//Ow...
//Quit it...
//Gurgle...
//Burp...
//Ow...
//Quit it...
//Gurgle...
//Burp...

////
//Ready to poke and feed...
//Ow...
//Quit it...
//Ow...
//Quit it...
//Gurgle...
//Burp...
//Gurgle...
//Burp...



