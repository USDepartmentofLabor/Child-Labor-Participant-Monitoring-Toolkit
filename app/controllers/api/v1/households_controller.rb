class Api::V1::HouseholdsController < Api::ApiController
  before_action :set_household, only: [:update]

  def index
    render json: Household.all.to_json
  end

  def create
    @household = Household.new(household_params)
    if @household.save
      render json: '{"status":"household create successful"}'
    else
      render json: '{"status":"household create failed"}'
    end       
  end
  
  def update   
    if @household.update(household_params)
      render json: '{"status":"update successful"}'
    else
      render json: '{"status":"update failed"}'
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_household
      @household = Household.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def household_params
      params.require(:household).permit(
        :name, :code, :intake_date, :address_line_1, :address_line_2,
        :postal_code, :dependent_locality, :locality, :adminv_area,
        :dependent_adminv_area, :country, :address_info)
    end

end