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


## 2º) The Tree class was interesting, but it did not allow you to specify
##	a new tree with a clean user interface. Let the initializer accept a
##	nested structure with hashes and arrays. You should be able to
##	specify a tree like this: {’grandpa’ => { ’dad’ => {’child 1’ => {}, ’child
##	2’ => {} }, ’uncle’ => {’child 3’ => {}, ’child 4’ => {} } } }.

class Tree
        attr_accessor :children, :node_name

        def initialize(tree)

		if (tree.size == 1)
			@children = []

			tree.each do |name ,childTree| 
				@node_name = name 
			
				childTree.each do |subChildName, subChildren|
					@children.push(Tree.new({subChildName => subChildren}))
				end
			end
		end
        end

        def visit_all(&block)
                visit &block
                children.each {|c| c.visit_all &block}
        end

        def visit(&block)
                block.call self
        end
end

tree = Tree.new({'grandpa' => {'dad' => {'child 1' => {},'child 2' => {}},'uncle' => {'child 3' => {},'child 4' => {}}}})
tree = Tree.new({'grandpa' => {
				 'dad' => {
						'child 1' => {}, 
						'child 2' => {} 
					},

				 'uncle' => {
						'child 3' => {},
						'child 4' => {}
					 }
			 }
		 })

puts "Only a node:"
tree.visit {|node| puts node.node_name}

puts "All the tree:"
tree.visit_all {|node| puts node.node_name}




## 3º) Write a simple grep that will print the lines of a file having any
##	occurrences of a phrase anywhere in that line. You will need to do
##	a simple regular expression match and read lines from a file. (This
##	is surprisingly simple in Ruby.) If you want, include line numbers.
class File
	
	def regexp(patron)

		matches = []
		lineNumber = 1

		File.new(self.path, 'r').each_line do |line| 
		
			if (line.grep(/#{patron}/).to_s != "") 
				matches.push("#{lineNumber}: #{line}")
			end
			lineNumber = lineNumber + 1
		end
		return matches
	end
end

file = File.new('example_file.txt', 'r')
puts file.regexp("En")
puts file.regexp("al")


## Second grep type
regexp = Regexp.new("al")

File.open('example_file.txt', "r").each_with_index do |line, index|
	if regexp.match(line)
		index = index + 1
		puts "#{index}: #{line}"
	end
end


