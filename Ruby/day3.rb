##########################################
##
## Language Ruby.
## - Day 3
##      Seven Languages in seven weeks
##
###########################################

#class Department < ActiveRecord::Base
#	has_many :employees
#	has_one :manager
#end


##################################################################################
#
## Exercise day 3
#
#  Modify the CSV application to support an each method to return a
#	CsvRow object. Use method_missing on that CsvRow to return the value
#	for the column for a given heading.
#
#	For example, for the file:
#		one, two
#		lions, tigers
#	
#	allow an API that works like this:
#	
#		csv = RubyCsv.new
#		csv.each {|row| puts row.one}
#	
#	This should print "lions".
#
##################################################################################
## Array to Hash
class Array
  def to_h(keys)
    Hash[*keys.zip(self).flatten]
  end
end


keys = Array['first', 'second', 'third', 'more']
values = Array['1º', 2, '3º']

values.to_h(keys)


module ActsAsCsv

	def self.included(base)
		base.extend ClassMethods
	end

	module ClassMethods

		def acts_as_csv
      			include InstanceMethods
    		end

  	end

	module InstanceMethods

    		def read
      			@csv_contents = []
      			filename = self.class.to_s.downcase + '.txt'
      			file = File.new(filename)

      			@headers = file.gets.chomp.split(', ')

      			file.each do |row|
        			@csv_contents << row.chomp.split(', ')
      			end
    		end

		def each
			@csv_contents.each do |row|

				if !row[0].nil?
					keys = @headers[0].split(',')
					values = row[0].split(',')

					yield CsvRow.new(values.to_h(keys))
				end
			end
		end

    		attr_accessor :headers, :csv_contents
    		
		def initialize
      			read
    		end
	end
end # End ActsAsCsv

class RubyCsv
	include ActsAsCsv
	acts_as_csv
end


class CsvRow

	attr_accessor :hashMap	

	def initialize(initHashMap)
		@hashMap = initHashMap
	end

	def method_missing name, *args
		@hashMap[name.to_s]
	end
end


csvRow = CsvRow.new(Hash['one' => 1, 'two' => 2])
puts "csvRow.one: " << csvRow.one.to_s
puts "csvRow.two: " << csvRow.two.to_s
puts

csvRow = CsvRow.new({'lions' => 'roar', 'tigers' => 'rooooaaarrrr'})
puts "csvRow.lions: " << csvRow.lions
puts "csvRow.tigers: " << csvRow.tigers
puts

rubyCsv = RubyCsv.new
puts "PROGRAMNAME, ADVERTISERCATEGORY"
rubyCsv.each {|row| puts row.PROGRAMNAME << ", " << row.ADVERTISERCATEGORY}




