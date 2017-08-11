class ServiceInstance < ActiveRecord::Base
  validates :service, presence: true
  validates :start_date, presence: true

  belongs_to :person
  belongs_to :service

  scope :by_start_date, -> { order(:start_date) }
end
