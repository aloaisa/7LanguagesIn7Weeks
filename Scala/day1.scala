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


val range = 0 until 10
//range: Range = Range(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)

range.start
//res2: Int = 0

range.end
//res3: Int = 10

range.step
//res4: Int = 1

(0 to 10) by 5
//res6: Range = Range(0, 5, 10)

(0 to 10) by 6
//res7: Range = Range(0, 6)

(0 until 10 by 5)
//res0: Range = Range(0, 5)

val range = (10 until 0) by -1
//range: Range = Range(10, 9, 8, 7, 6, 5, 4, 3, 2, 1)

val range = (10 until 0)
//range: Range = Range()

val range = (0 to 10)
//range: Range.Inclusive = Range(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

val range = 'a' to 'e'
//range: RandomAccessSeq.Projection[Char] = RandomAccessSeq.Projection(a, b, c, d, e)

val person = ("Elvis", "Presley")
//person: (java.lang.String, java.lang.String) = (Elvis,Presley)

person._1
//res9: java.lang.String = Elvis

person._2
//res10: java.lang.String = Presley

//person._3
//<console>:6: error: value _3 is not a member of (java.lang.String, java.lang.String)
//        person._3
//               ^

val (x, y) = (1, 2)
//x: Int = 1
//y: Int = 2

val (a, b) = (1, 2, 3)
//<console>:15: error: constructor cannot be instantiated to expected type;
// found: (T1, T2)
// required: (Int, Int, Int)
//       val (a, b) = (1, 2, 3)
//           ^
//<console>:15: error: recursive value x$1 needs type
//       val (a, b) = (1, 2, 3)
//            ^




class Person(firstName: String, lastName: String)
//defined class Person

val gump = new Person("Forrest", "Gump")
//gump: Person = Person@7c6d75b6



















