class CustomField < ActiveRecord::Base
  validates :name, presence: true
  validates :field_type, presence: true
  validates :model_type, presence: true
  validates :sort_order, presence: true

  belongs_to :custom_section
  belongs_to :customizable, polymorphic: true
  has_many :custom_values

  default_scope { order(:custom_section_id, :sort_order) }

  attr_accessor :model_id

  def value
    return nil if model_id.nil? || model_type.nil? || custom_value.nil?

    JSON.parse custom_value.value_text
  end

  def value= v
    return if model_id.nil? || model_type.nil?

    if custom_value.nil?
      cv = CustomValue.new(custom_field_id: id, model_id: model_id, value_text: v.to_json)
      custom_values.push cv
    else
      custom_value.update(value_text: v.to_json)
    end
  end

private
  def custom_value
    custom_values.where(model_id: model_id).first
  end
end
