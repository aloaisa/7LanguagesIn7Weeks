##########################################
##
## Language Ruby.
## - Day 1
## 	Seven Languages in seven weeks
##
###########################################

# 1º) Print the String "Hello, world."
puts 'Hello, world.'


# 2º) For the string "Hello, Ruby" find the index of the word "Ruby"
"Hello, Ruby".index "Ruby"


# 3º) Print your name ten times.
10.times {
	puts "Alvaro"
}


# 4º) Print the String "This is sentence number 1," where the number 1 
#	changes from 1 to 10.
10.times { | number |
	puts "This is sentence number #{number + 1},"
}


# 5º) Run a Ruby program from a file
#	- Save this file as day1.rb
#	- Write in the shell  "ruby day1.rb"


# 6º) Bonus problem: if you're feeling the need for a little more, write 
#	a program that picks a random number. Let a player guess the
#	number, telling the player whether the guest is too low o too high.

random = rand(10) + 1
puts "Pick a number between 1 and 10:"

while (number = gets.to_i) != random

	if number < random
		puts "Your number is too low: #{number}  Try again."
	else
		puts "Your number is too high: #{number} Try again."
	end
end
puts "Yes it's #{random} Guessed!!"

