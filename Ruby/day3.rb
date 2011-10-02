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
puts csvRow.one
puts csvRow.two

csvRow = CsvRow.new({'lions' => 'roar', 'tigers' => 'rooooaaarrrr'})
puts csvRow.lions
puts csvRow.tigers

rubyCsv = RubyCsv.new
rubyCsv.each {|row| puts row.PROGRAMNAME}




