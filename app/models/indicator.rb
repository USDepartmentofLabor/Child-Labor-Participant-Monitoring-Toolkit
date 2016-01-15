class Indicator < ActiveRecord::Base
  belongs_to :project
	has_many :indicators
	has_one :unit_of_measure
	
	validates :code, presence: true
	validates :indicator, presence: true

  def self.create_default(project_id, user_id)
    DBMS::DefaultData::Indicators.create(project_id, user_id)
  end
end
