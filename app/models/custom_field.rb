class CustomField < ActiveRecord::Base
  has_many :custom_value

  def self.with_values(model_id)
    includes(:custom_value).where(model_id: model_id).references(:custom_values)
  end
end
