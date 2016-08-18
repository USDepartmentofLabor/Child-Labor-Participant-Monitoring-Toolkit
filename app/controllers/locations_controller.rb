class LocationsController < ApplicationController
  before_action :set_project

  def create
    @location = Location.new(location_params)
    @location.project_id = @project.id

    respond_to do |format|
      if @location.save
        format.html {
          redirect_to :back, notice: t("action_messages.create",
                                       model: Location.model_name.human)
        }
        format.js
      else
        format.html {
          redirect_to :back, alert: t("action_messages.create_failed",
                                      model: Location.model_name.human,
                                      error: alert)
        }
        format.js
      end
    end
  end

  private

  def set_project
    @project = Project.first
  end

  def location_params
    params.require(:location).permit(
      :name, :address_line1, :address_line2, :city, :state, :zip, :country,
      :id, :location_type_id, :project_id
    )
  end
end
