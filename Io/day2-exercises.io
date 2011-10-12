##########################################
##
## Language Io.
## - Day 2
##      Seven Languages in seven weeks
##
###########################################

## 1. A Fibonacci sequence starts with two 1s. Each subsequent num-
#	ber is the sum of the two numbers that came before: 1, 1, 2, 3,
#	5, 8, 13, 21, and so on. Write a program to find the nth Fibonacci
#	number. fib(1) is 1, and fib(4) is 3. As a bonus, solve the problem
#	with recursion and with loops.

# Normal solution  
fib := method(last_index,

		if (last_index < 3,
			return 1
		)

		first := 1
		second := 1

		for(unused, 1, last_index-1, total := first + second
			first := second;
			second = total;
		)

		return first
)

"\nNormal solution\n" println
for(number, 1, 10,
	writeln( "Iteration ", number, ": ", fib(number))
)



# Recursive solution
fib_recursion := method (number,

        if(number < 2,
                return number
        )

        return fib_recursion(number - 1) + fib_recursion(number - 2)
)


"\nRecursive solution\n" println
for(number, 1, 10,
	writeln("Iteration ", number, ": ", fib_recursion(number))
)



## 2. How would you change / to return 0 if the denominator is zero?
div := Number getSlot("/")
Number / = method(number,
		if(number == 0, 
			return 0,
			call target div(number)
		)
	)

"81 / 9 = 9 " println
(81/9) println

"15 / 0 = 0" println
(15/0) println


## 3. Write a program to add up all of the numbers in a two-dimensional
#	array.
numberList := method ( list,
  list flatten sum
)

"1 + 2 + 3 + 4 + 5 + 6 + 7 = 28" println
numberList(list(list(1, 2), list(3, 4), list(5, 6, 7))) println



## 4. Add a slot called myAverage to a list that computes the average of
#	all the numbers in a list. What happens if there are no numbers
#	in a list? (Bonus: Raise an Io exception if any item in the list is not
#	a number.)
 
List myAverage := method((self sum) / (self size))

list1 := list (1, 2, 3, 4)
"(1 + 2 + 3 + 4) / 4 = 2.5" println
list1 myAverage println

list2 := list ("Launch a Exception", 2, 3, 4)
#"Launch a Exception" println
#list2 myAverage println


## 5. Write a prototype for a two-dimensional list. The dim(x, y) method
#	should allocate a list of y lists that are x elements long. set(x, y,
#	value) should set a value, and get(x, y) should return that value.


TwoDimension := List clone;

TwoDimension dim := method(x, y,
	self setSize(x);

	for (i, 0, (x - 1), 1,
		self atPut(i,
			(list setSize(y))
		)
	)
)

TwoDimension get := method (x, y,
        return self at(x) at(y)
)

TwoDimension set := method (x, y, value,
	self at(x) atPut(y,value)
	return self
)

matrix := TwoDimension clone dim(3, 3)
matrix println
matrix set(0, 0, "O")
matrix set(0, 1, "1")
matrix set(0, 2, "2")
matrix set(2, 2, "3")
matrix get(2, 2) println


## 6. Bonus: Write a transpose method so that (new_matrix get(y, x)) ==
#	matrix get(x, y) on the original list.


TwoDimension transpose := method (

	tempX := self size
	tempY := self first size
	
	tempMatrix := TwoDimension clone dim ( tempY, tempX )

	for (rol_x, 0, (tempX - 1),
		for(rol_y, 0, (tempY - 1),
			tempMatrix set(rol_y, rol_x, self get(rol_x, rol_y))
		)
	)

	tempMatrix
)

matrix := TwoDimension clone dim(3, 3)
matrix set(0, 0, "O")
matrix set(0, 1, "1")
matrix set(0, 2, "2")
matrix set(1, 0, "3")
matrix set(1, 1, "4")
matrix set(1, 2, "5")
matrix set(2, 0, "6")
matrix set(2, 1, "7")
matrix set(2, 2, "8")
matrix println

matrix2 := matrix transpose
matrix2 println


## 7. Write the matrix to a file, and read a matrix from a file.

TwoDimension writeToFile := method (
        File with("TwoDimension.txt") open write(self serialized) close
)

matrix2 writeToFile 
matrix := doFile("TwoDimension.txt");
matrix println



## 8. Write a program that gives you ten tries to guess a random number
#	from 1–100. If you would like, give a hint of “hotter” or “colder”
#	after the first guess.


numbe := Random value(1,100) round
line := File standardInput;
attempts := 0
prev_diff := nil

"\nPick a number between 1 and 100: " println

while(attempts < 10,

	try := line readLine("Try: ")

	try := try asNumber

	if(try isNan, continue)

	difference := (number - try) abs

	if(difference == 0,
		"Yes Guessed!!" println
		break
	)

	if(prev_diff > difference,
			"Hotter" println,
			"Colder" println
	)

	prev_diff := difference
)




