class ServiceTypesController < ApplicationController

  def index
    @service_types = ServiceType.order(:name).all
  end

  def new
    @service_type = ServiceType.new
  end

  def edit
    @service_type = ServiceType.find(params[:id])
  end

  def create
    @service_type = ServiceType.new(service_type_params)

    if @service_type.save
      redirect_to service_types_path, notice: t("action_messages.create", model: "Service Type")
    else
      render :new
    end
  end

  def update
    @service_type = ServiceType.find(params[:id])

    if @service_type.update(service_type_params)
      redirect_to service_types_path, notice: t("action_messages.update", model: "Service Type")
    else
      render :edit
    end
  end

  private

  def service_type_params
    params.require(:service_type).permit(:name, :definition, :service_type_category_id)
  end

end
