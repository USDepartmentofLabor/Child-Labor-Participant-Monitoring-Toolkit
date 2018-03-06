class Api::V1::CustomValuesController < Api::ApiController
  before_filter :ensure_user_allowed

  # GET /api/custom_values
  def index
    render json: CustomValue.all.to_json
  end

  # POST /api/custom_values
  def create
    if !validate_request
      render status: 400, json: '{"status":"failure"}'
      return
    end

    @custom_value = CustomValue.new(custom_value_params)
    if @custom_value.save
      render status: 201, json: '{"status":"success","updated_at":"' +
        get_datetime_formatted(@custom_value.updated_at) + '","created_at":"' +
        get_datetime_formatted(@custom_value.created_at) + '","id":"' +
        @custom_value.id.to_s + '"}'
    else
      render status: 500, json: '{"status":"failure"}'
    end
  end

  private

  def validate_request
    # check that custom_field_id is valid
    if custom_value_params[:custom_field_id].present?
      if !CustomField.exists?(custom_value_params[:custom_field_id])
        return false
      end
    end

    # check that model_id is valid
    if custom_value_params[:model_id].present?
      # get the model type from the CustomField and check that the model id is valid
      # for now just look for { Household, Person }
      @custom_field = CustomField.find(custom_value_params[:custom_field_id])
      if @custom_field.model_type == 'Household'
        if !Household.exists?(custom_value_params[:model_id])
          return false
        end
      elsif @custom_field.model_type == 'Person'
        if !Person.exists?(custom_value_params[:model_id])
          return false
        end
      else
        return false
      end
    end

    return true
  end

  def custom_value_params
    params.require(:custom_value).permit(
      :custom_field_id, :value_text, :model_id)
  end

end
