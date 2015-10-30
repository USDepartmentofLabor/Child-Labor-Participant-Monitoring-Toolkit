class Report < ActiveRecord::Base
  validates :user_id, presence: true
  validates :project_id, presence: true

  belongs_to :project

  def date_range_in_text
    "#{start_date.strftime("%d %b. %Y")} - #{end_date.strftime("%d %b. %Y")}"
  end
end
