class Report < ActiveRecord::Base
  validates :user_id, presence: true
  validates :project_id, presence: true

  belongs_to :projects
  
  def date_range_in_text
    "#{start_date.strftime("%d %b. %Y")} - #{end_date.strftime("%d %b. %Y")}"
  end

  def self.create_default(project, user)
    DBMS::DefaultData::Indicators.create(project, user)
  end
end
