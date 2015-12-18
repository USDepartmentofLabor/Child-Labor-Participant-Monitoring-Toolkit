class Service < ActiveRecord::Base
  has_many :service_instances
  has_and_belongs_to_many :children
  belongs_to :service_type
  belongs_to :project
end
