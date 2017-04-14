class CustomSection < ActiveRecord::Base
  has_many :custom_fields
  belongs_to :sectionable, polymorphic: true

  def custom_fields_with_values model_id
    cf = []

    custom_fields.each do |c|
      c
    end
  end

end
