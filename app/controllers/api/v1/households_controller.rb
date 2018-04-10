class Api::V1::HouseholdsController < Api::ApiController
  before_filter :ensure_user_allowed

  # GET /api/households
  def index
    render json: Household.all.to_json
  end

  # GET /api/households/1
  def show
    if Household.exists?(params[:id])
      set_household
      render json: @household.to_json
    else
      render status: 404, json: '{"status":"failure"}'
    end
  end

  # POST /api/households
  def create
    @household = Household.new(household_params)
    if @household.save
      render status: 201, json: '{"status":"success","updated_at":"' +
        get_datetime_formatted(@household.updated_at) + '","created_at":"' +
        get_datetime_formatted(@household.created_at) + '","id":"' +
        @household.id.to_s + '"}'
    else
      render status: 500, json: '{"status":"failure"}'
    end
  end

  # PUT /api/households/1
  def update
    if Household.exists?(params[:id])
      set_household
      if @household.update(household_params)
        render json: '{"status":"success", "updated_at":"' +
          get_datetime_formatted(@household.updated_at) + '"}'
      else
        render status: 500, json: '{"status":"failure"}'
      end
    else
      render status: 404, json: '{"status":"failure"}'
    end
  end

  private

  def set_household
    @household = Household.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def household_params
    params.require(:household).permit(
      :name, :code, :intake_date, :address_line_1, :address_line_2,
      :postal_code, :dependent_locality, :locality, :adminv_area,
      :dependent_adminv_area, :country, :address_info, :latitude, :longitude,
      :position_accuracy, :altitude, :altitude_accuracy, :heading, :speed,
      :gps_recorded_at)
  end

end
