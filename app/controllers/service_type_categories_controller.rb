class ServiceTypeCategoriesController < ApplicationController

  def index
    @service_type_categories = ServiceTypeCategory.order(:name).all
  end

  def new
    @service_type_category = ServiceTypeCategory.new
  end

  def edit
    @service_type_category = ServiceTypeCategory.find(params[:id])
  end

  def create
    @service_type_category = ServiceTypeCategory.new(service_type_category_params)

    if @service_type_category.save
      redirect_to service_type_categories_path, notice: t("action_messages.create", model: "Service Type Category")
    else
      render :new
    end
  end

  def update
    @service_type_category = ServiceTypeCategory.find(params[:id])

    if @service_type_category.update(service_type_category_params)
      redirect_to service_type_category_path, notice: t("action_messages.update", model: "Service Type Category")
    else
      render :edit
    end
  end

  private

  def service_type_category_params
    params.require(:service_type_category).permit(:name, :definition)
  end

end
