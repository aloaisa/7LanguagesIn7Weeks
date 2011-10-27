/*******************************************
**
** Language Scala.
** - Day 1
**      Seven Languages in seven weeks
**
******************************************/

println("Hello, surreal world")
//Hello, surreal world

1 + 1
//res1: Int = 2

(1).+(1)
//res2: Int = 2

5 + 4 * 3
//res3: Int = 17

5.+(4.*(3))
//res4: Double = 17.0

(5).+((4).*(3))
//res5: Int = 17

"abc".size
//res6: Int = 3

"abc" + 4
//res7: java.lang.String = abc4

4 + "1.0"
//res8: String = 41.0

/** 4 * "abc"
<console>:8: error: overloaded method value * with alternatives:
  (x: Double)Double <and>
  (x: Float)Float <and>
  (x: Long)Long <and>
  (x: Int)Int <and>
  (x: Char)Int <and>
  (x: Short)Int <and>
  (x: Byte)Int
 cannot be applied to (java.lang.String)
       4 * "abc"
         ^
**/

5 < 6
//res10: Boolean = true

5 <= 6
//res11: Boolean = true

5 <= 2
//res12: Boolean = false

5 >= 2
//res13: Boolean = true

5 != 2
//res14: Boolean = true

val a = 1
val b = 2
if (b < a) {
	println("true")
} else {
	println("false")
}
// false

Nil
//res16: scala.collection.immutable.Nil.type = List()

//if(0) {println("true")}
//<console>:8: error: type mismatch;
// found   : Int(0)
// required: Boolean
//       if(0) {println("true")}
//          ^

//if(Nil) {println("true")}
//<console>:8: error: type mismatch;
// found   : scala.collection.immutable.Nil.type (with underlying type object Nil)
// required: Boolean
//       if(Nil) {println("true")}
//          ^


def whileLoop {
	var i = 1

	while(i <= 3) {
		println(i)
		i += 1
	}
}

whileLoop



