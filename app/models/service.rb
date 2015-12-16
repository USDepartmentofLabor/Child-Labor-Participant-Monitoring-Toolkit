class Service < ActiveRecord::Base
  has_many :service_instances
  belongs_to :service_type
  belongs_to :project
end
