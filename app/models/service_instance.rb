class ServiceInstance < ActiveRecord::Base
  validates :service, presence: true
  validates :start_date, presence: true

  belongs_to :child
  belongs_to :service
end
