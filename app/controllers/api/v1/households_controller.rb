class Api::V1::HouseholdsController < Api::ApiController

  def index
    render json: Household.all.to_json
  end

  def create
    @household = Household.new(household_params)
    if @household.save
      render json: '{"status":"submitted"}'
    else
      render json: '{"status":"failed"}'
    end       
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def household_params
      params.require(:household).permit(
        :name, :code, :intake_date, :address_line_1, :address_line_2,
        :postal_code, :dependent_locality, :locality, :adminv_area,
        :dependent_adminv_area, :country, :address_info)
    end

end