class Report < ActiveRecord::Base
  validates :user_id, presence: true
  validates :project_id, presence: true

  belongs_to :projects
  
  def date_range_in_text
    "#{start_date.strftime("%d %b. %Y")} - #{end_date.strftime("%d %b. %Y")}"
  end

  def self.create_default(project_id, user_id)
    DBMS::DefaultData::Indicators.create(project_id, user_id)
  end
end
