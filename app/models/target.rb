class Target < ActiveRecord::Base
	belongs_to :indicator
	belongs_to :reporting_period
end
