class CustomField < ActiveRecord::Base
  has_many :custom_values

  def self.with_values(model_id)
    includes(:custom_values).where("custom_values.model_id = ?", model_id).references(:custom_values)
    # joins("LEFT JOIN custom_values ON custom_values.custom_field_id = custom_fields.id").where("custom_values.model_id = ?", model_id)
  end

  def custom_value
    custom_values.first
  end
end
