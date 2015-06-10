class Child < ActiveRecord::Base
	# sex/gender i18n string with integer value pair
	# Integer value follows ISO standards: http://en.wikipedia.org/wiki/ISO/IEC_5218
	SEX_OPTIONS = [ ["select_options.child.male", 1], ["select_options.child.female", 2] ]

	validates :fname, presence: true
	validates :lname, presence: true
	validates :country, length: {maximum: 2}
	validates :sex, presence: true, inclusion: { in: [1,2] }
end
