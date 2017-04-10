class CustomField < ActiveRecord::Base
  belongs_to :custom_section
  has_many :custom_values

  default_scope { order(:custom_section_id, :sort_order) }

  def self.with_values(model_id)
    # includes not work when the custom_values does not exists...
    # includes(:custom_values).where("custom_values.model_id = ?", model_id).references(:custom_values)
    select("custom_fields.*, custom_values.value_text as custom_value_text")
      .joins("LEFT OUTER JOIN custom_values ON custom_values.custom_field_id = custom_fields.id AND custom_values.model_id = #{model_id.to_i}")
  end

  def custom_value(model_id)
    custom_values.where(model_id: model_id).first
  end

  def custom_value_text(model_id)
    if custom_value(model_id).present?
      v = JSON.parse custom_value(model_id).value_text
      if v.is_a? Array
        return v
      else
        return v["value_text"]
      end
    end
    nil
  end

  def custom_value_other(model_id)
    if custom_value(model_id).present?
      v = JSON.parse custom_value(model_id).value_text
      return v["other"]
    end
    nil
  end
end
