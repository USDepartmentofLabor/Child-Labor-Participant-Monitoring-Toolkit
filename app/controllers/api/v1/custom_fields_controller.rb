class Api::V1::CustomFieldsController < Api::ApiController
  before_filter :ensure_user_allowed

  # GET /api/custom_fields
  def index
    render json: CustomField.all.to_json
  end

end
