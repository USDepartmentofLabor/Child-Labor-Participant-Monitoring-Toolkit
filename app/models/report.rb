class Report < ActiveRecord::Base

  def date_range_in_text
    "#{start_date.strftime("%d %b. %Y")} - #{end_date.strftime("%d %b. %Y")}"
  end
end
