class LocationsController < ApplicationController
  def create
    @location = Location.new(location_params)
    
    if @location.save
    end
  end

  private

  def location_params
    params.require(:location).permit(
      :name, :address_line1, :address_line2, :city, :state, :zip, :country,
      :id, :location_type_id, :project_id
    )
  end
end
