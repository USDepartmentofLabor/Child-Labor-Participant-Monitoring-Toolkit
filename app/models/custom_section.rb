class CustomSection < ActiveRecord::Base
  has_many :custom_fields
  belongs_to :sectionable, polymorphic: true
end
