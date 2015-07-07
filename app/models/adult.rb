class Adult < ActiveRecord::Base
  belongs_to :household

  SEX_OPTIONS = [ ["select_options.adult.male", 1], ["select_options.adult.female", 2] ]

  def full_name
    mname ? "#{fname} #{mname} #{lname}" : "#{fname} #{lname}"
  end
end
