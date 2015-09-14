class Indicator < ActiveRecord::Base
  belongs_to :project

  def self.create_default(project_id, user_id)
    DBMS::DefaultData::Indicators.create(project_id, user_id)
  end
end
