class CustomValue < ActiveRecord::Base
  validates :model_id, presence: true
  validates :custom_field_id, presence: true
  belongs_to :custom_field
end
