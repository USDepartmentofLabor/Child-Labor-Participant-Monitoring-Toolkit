class ServiceType < ActiveRecord::Base
  has_one :service_type_category
end
