class ServiceInstance < ActiveRecord::Base
  belongs_to :child
  belongs_to :service
end
