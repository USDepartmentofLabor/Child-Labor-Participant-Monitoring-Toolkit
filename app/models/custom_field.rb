class CustomField < ActiveRecord::Base
  has_many :custom_values

  def self.with_values(model_id)
    # includes not work when the custom_values does not exists...
    # includes(:custom_values).where("custom_values.model_id = ?", model_id).references(:custom_values)
    select("custom_fields.*, custom_values.value_text as custom_value_text")
      .joins("LEFT OUTER JOIN custom_values ON custom_values.custom_field_id = custom_fields.id AND custom_values.model_id = #{model_id.to_i}")
  end

  def custom_value
    custom_values.first
  end
end
