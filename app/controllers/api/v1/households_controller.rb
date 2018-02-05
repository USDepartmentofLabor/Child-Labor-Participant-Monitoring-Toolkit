class Api::V1::HouseholdsController < Api::ApiController
  before_filter :ensure_user_allowed
  before_action :set_household, only: [:show, :update]

  # GET /api/v1/households  
  def index
    render json: Household.all.to_json
  end

  # GET /api/v1/households/1
  def show
    render json: @household.to_json
  end

  # POST /api/v1/households
  def create
    @household = Household.new(household_params)
    if @household.save
      render json: '{"status":"success","updated_at":"' +
        get_datetime_formatted(@household.updated_at) +
        '","created_at":"' +
        get_datetime_formatted(@household.created_at) +
        '","id":"' + @household.id.to_s + '"}'
    else
      render json: '{"status":"failure"}'
    end       
  end
  
  # PUT /api/v1/households/1
  def update   
    if @household.update(household_params)
      render json: '{"status":"success", "updated_at":"' +
      get_datetime_formatted(@household.updated_at) + '"}'
    else
      render json: '{"status":"failure"}'
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