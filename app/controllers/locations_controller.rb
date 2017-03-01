class LocationsController < ApplicationController
  before_action :set_project
  before_action :set_location, only: [:update, :destroy]

  def create
    @location = Location.new(location_params)
    @location.project_id = @project.id

    if @location.save
      redirect_to root_path, notice: t("action_messages.create",
        model: Location.model_name.human)
    else
      render json: @location.errors, status: :bad_request
    end
  end

  def update
    if @location.update_attributes(location_params)
      head :no_content
    else
      render json: @location.errors, status: :bad_request
    end
  end

  def destroy
    @location.destroy
    redirect_to :back, notice: t("action_messages.destroy",
                                model: Location.model_name.human)
  end

  private

  def set_project
    @project = Project.first
  end

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(
      :name, :address_line1, :address_line2, :city, :state, :zip, :country,
      :id, :location_type_id, :project_id
    )
  end
end
