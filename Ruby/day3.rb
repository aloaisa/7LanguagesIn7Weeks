##########################################
##
## Language Ruby.
## - Day 3
##      Seven Languages in seven weeks
##
###########################################

class Department < ActiveRecord::Base
	has_many :employees
	has_one :manager
end

