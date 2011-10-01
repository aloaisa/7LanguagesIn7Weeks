##########################################
##
## Language Ruby.
## - Day 2
##      Seven Languages in seven weeks
##
###########################################

#- Keep the following things in mind when using blocks as part of your interface:
#
#	If you create a collection class that you need to traverse, build on top 
#		of Enumerable rather than reinventing the wheel.
#
#	If you have shared code that differs only in the middle, create a helper
#		method that yields a block in between the pre/postprocessing code
#		to avoid duplication of effort.
#
#	If you use the &block syntax, you can capture the code block provided to 
#		a method inside a variable. You can then store this and use it 
#		later, which is very useful for creating dynamic callbacks.
#
#	Using a combination of &block and instance_eval, you can execute blocks 
#		within the context of arbitrary objects, which opens up a lot of
#		doors for highly customized interfaces.
#
#	The return value of yield (and block.call) is the same as the return
#		value of the provided block.


## Array to Hash
class Array
  def to_h(keys)
    Hash[*keys.zip(self).flatten]
  end
end


keys = Array['first', 'second', 'third', 'more']
values = Array['1º', 2, '3º']

values.to_h(keys)


## Hash to Array
hash = values.to_h(keys)
puts hash.class

hash.to_a
hash.to_a.class

# Iterate through a hash and a array
hash.each {|a, b| puts "a: #{a} b: #{b}" }
hash.to_a.each {|a, b| puts "a: #{a} b: #{b}" }


## 1º)
## Print the contents of an array of sixteen numbers, four numbers at the time,
##	 using just each. Now, do the same with each_slice in Enumerable.

numbers = (1..16).to_a

numbers.each do |num|
	if (num % 4 == 0) 
		puts "#{numbers[num - 4]}, #{numbers[num - 3]}, #{numbers[num - 2]}, #{numbers[num - 1]}"
	end
end


numbers.each_slice(4) do |uno, dos, tres, cuatro|
	 puts "#{uno}, #{dos}, #{tres}, #{cuatro}"
end

