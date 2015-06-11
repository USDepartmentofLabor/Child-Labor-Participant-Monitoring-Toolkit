class Child < ActiveRecord::Base
	# sex/gender i18n string with integer value pair
	# Integer value follows ISO standards: http://en.wikipedia.org/wiki/ISO/IEC_5218
	SEX_OPTIONS = [ ["select_options.child.male", 1], ["select_options.child.female", 2] ]

	validates :fname, presence: true
	validates :lname, presence: true
	validates :country, length: {maximum: 2}
	validates :sex, presence: true, inclusion: { in: [1,2] }

	has_many :statuses, class_name: :child_statuses

	def country_name
		return nil if country.nil?
    country_iso = ISO3166::Country[country]
    country_iso.translations[I18n.locale.to_s] || country_iso.name
  end

  def gender_name
  	return nil if sex.nil?
		option = SEX_OPTIONS[sex - 1]
		return I18n.t(option[0])
	end
end
