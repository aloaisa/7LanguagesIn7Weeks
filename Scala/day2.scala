/*******************************************
**
** Language Scala.
** - Day 2
**      Seven Languages in seven weeks
**
******************************************/

def double(x:Int):Int = x * 2
//double: (Int)Int

double(4)
//res0: Int = 8


def double(x:Int):Int = {
	x * 2
}
//double: (Int)Int

double(6)
//res1: Int = 12


var mutable = "I am mutable"
//mutable: java.lang.String = I am mutable

mutable = "Touch me, change me..."
//mutable: java.lang.String = Touch me, change me...

val immutable = "I am not mutable"
//immutable: java.lang.String = I am not mutable

//immutable = "Can't touch this"
//<console>:5: error: reassignment to val
//       immutable = "Can't touch this"
//                 ^


List(1, 2, 3)
//res4: List[Int] = List(1, 2, 3)

List("one", "two", "three")
//res5: List[java.lang.String] = List(one, two, three)

List("one", "two", 3)
//res6: List[Any] = List(one, two, 3)

List("one", "two", 3)(2)
//res7: Any = 3

//List("one", "two", 3)(4)
//java.util.NoSuchElementException: head of empty list
//	at scala.Nil$.head(List.scala:1365)
//	at scala.Nil$.head(List.scala:1362)
//	at scala.List.apply(List.scala:800)
//	at .<init>(<console>:5)
//	at .<clinit>(<console>)
//	at RequestResult$.<init>(<console>:3)
//	at RequestResult$.<clinit>(<console>)
//	at RequestResult$result(<console>)
//	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Met...


List("one", "two", 3)(-1)
//res9: Any = one

List("one", "two", 3)(-2)
//res10: Any = one

List("one", "two", 3)(-3)
//res11: Any = one

Nil
//res12: Nil.type = List()

val animals = Set("lions", "tigers", "bears")
//animals: scala.collection.immutable.Set[java.lang.String] = Set(lions, tigers, bears)

animals + "armadillos"
//res13: scala.collection.immutable.Set[java.lang.String] = Set(lions, tigers, bears, armadillos)

animals - "tigers"
//res14: scala.collection.immutable.Set[java.lang.String] = Set(lions, bears)

//animals + Set("armadillos", "raccoons")
//<console>:6: error: type mismatch;
// found   : scala.collection.immutable.Set[java.lang.String]
// required: java.lang.String
//       animals + Set("armadillos", "raccoons")
//                 ^

animals ++ Set("armadillos", "raccoons")
//res16: scala.collection.immutable.Set[java.lang.String] = Set(bears, tigers, armadillos, raccoons, lions)

animals -- Set("lions", "bears")
//res17: scala.collection.immutable.Set[java.lang.String] = Set(tigers)

animals ** Set("armadillos", "raccoons", "lions", "tigers")
//res18: scala.collection.immutable.Set[java.lang.String] = Set(lions, tigers)

Set(1, 2, 3) == Set(3, 2, 1)
//res19: Boolean = true

List(1, 2, 3) == List(3, 2, 1)
//res20: Boolean = false


val ordinals = Map(0 -> "zero", 1 -> "one", 2 -> "two")
//ordinals: scala.collection.immutable.Map[Int,java.lang.String] = Map(0 -> zero, 1 -> one, 2 -> two)

ordinals(2)
//res21: java.lang.String = two


import scala.collection.mutable.HashMap
//import scala.collection.mutable.HashMap

val map = new HashMap[Int, String]
//map: scala.collection.mutable.HashMap[Int,String] = Map()

map += 4 -> "four"
map += 8 -> "eight"

map
//res24: scala.collection.mutable.HashMap[Int,String] = Map(4 -> four, 8 -> eight)

//map += "zero" -> 0
//<console>:7: error: overloaded method value += with alternatives (Int)map.MapTo <and> ((Int, String))Unit cannot be applied to ((java.lang.String, Int))
//       map += "zero" -> 0
//           ^




val list = List("frodo", "samwise", "pippin")
//list: List[java.lang.String] = List(frodo, samwise, pippin)

list.foreach(hobbit => println(hobbit))
//frodo
//samwise
//pippin

val hobbits = Set("frodo", "samwise", "pippin")
//hobbits: scala.collection.immutable.Set[java.lang.String] = Set(frodo, samwise, pippin)

hobbits.foreach(hobbit => println(hobbit))
//frodo
//samwise
//pippin

val hobbits = Map("frodo" -> "hobbit", "samwise" -> "hobbit", "pippin" -> "hobbit")
//hobbits: scala.collection.immutable.Map[java.lang.String,java.lang.String] = Map(frodo -> hobbit, samwise -> hobbit, pippin -> hobbit)

hobbits.foreach(hobbit => println(hobbit))
//(frodo,hobbit)
//(samwise,hobbit)
//(pippin,hobbit)

hobbits.foreach(hobbit => println(hobbit._1))
//frodo
//samwise
//pippin

hobbits.foreach(hobbit => println(hobbit._2))
//hobbit
//hobbit
//hobbit


list
//res32: List[java.lang.String] = List(frodo, samwise, pippin)

list.isEmpty
//res33: Boolean = false

Nil.isEmpty
//res34: Boolean = true

list.length
//res35: Int = 3

list.size
//res36: Int = 3

list.head
//res37: java.lang.String = frodo

list.tail
//res38: List[java.lang.String] = List(samwise, pippin)

list.last
//res39: java.lang.String = pippin

list.init
//res40: List[java.lang.String] = List(frodo, samwise)

list.reverse
//res41: List[java.lang.String] = List(pippin, samwise, frodo)

list.drop(1)
//res42: List[java.lang.String] = List(samwise, pippin)

list
//res43: List[java.lang.String] = List(frodo, samwise, pippin)

list.drop(2)
//res44: List[java.lang.String] = List(pippin)


val words = List("peg", "al", "bud", "kelly")
//words: List[java.lang.String] = List(peg, al, bud, kelly)

words.count(word => word.size > 2)
//res45: Int = 3

words.filter(word => word.size > 2)
//res46: List[java.lang.String] = List(peg, bud, kelly)

words.map(word => word.size)
//res47: List[Int] = List(3, 2, 3, 5)

words.forall(word => word.size > 1)
//res48: Boolean = true

words.exists(word => word.size > 4)
//res49: Boolean = true

words.exists(word => word.size > 5)
//res50: Boolean = false

words.sort((s, t) => s.charAt(0).toLowerCase < t.charAt(0).toLowerCase)
//res51: List[java.lang.String] = List(al, bud, kelly, peg)

words.sort((s, t) => s.size < t.size)
//res52: List[java.lang.String] = List(al, bud, peg, kelly)


val list = List(1, 2, 3)
//list: List[Int] = List(1, 2, 3)

val sum = (0 /: list) {(sum, i) => sum + i}
//sum: Int = 6

list.foldLeft(0)((sum, value) => sum + value)
//res53: Int = 6



