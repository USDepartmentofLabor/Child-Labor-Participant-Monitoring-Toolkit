class Frequency < ActiveRecord::Base
  has_one :indicator, foreign_key: :reporting_frequency_id
end
