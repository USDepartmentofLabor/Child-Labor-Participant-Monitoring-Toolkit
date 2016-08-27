class ChildStatus < ActiveRecord::Base
  belongs_to :child
  belongs_to :work_status
  belongs_to :education_status

  validates :user_id, presence: true
  validates :start_date, presence: true

  scope :latest, -> { order(start_date: :desc).first }
  scope :latest_education, -> { where("education_status_id is not null").order(start_date: :desc).first }
  scope :latest_work, -> { where("work_status_id is not null").order(start_date: :desc).first }

  def name= name
    @name = name
  end

  def name
    @name
  end
end
