class Api::V1::HouseholdsController < Api::ApiController

  def index
    render json: Household.all.to_json
  end

  def create              
    household = Household.new(household_params) 
    if household.save
      render json: '{"status":"submitted"}'
    else
      render json: '{"status":"failed"}'
    end        
  end

  def household_params
    params[:household].permit(:name, :intake_date)
  end
end