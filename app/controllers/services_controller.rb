class ServicesController < ApplicationController
  before_action :set_project
  before_action :set_children
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  # GET /services
  def index
    @services = Service.order(:name).page(params[:page])

    @search = Service.ransack(params[:q])
    @search.build_condition
  end

  def search
    @search = Service.ransack(params[:q])
    @services = @search.result(distinct: true)
  end

  # GET /services/1
  def show
  end

  # GET /services/new
  def new
    @service = Service.new
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services
  def create
    @service = Service.new(service_params)

    if @service.save
      redirect_to services_path(), notice: t("action_messages.create", model: Service.model_name.human)
    else
      render :new
    end
  end

  # PATCH/PUT /services/1
  def update
    if @service.update(service_params)
      redirect_to service_path(@service), notice: t("action_messages.update", model: Service.model_name.human)
    else
      render :edit
    end
  end

  # only delete service-project relation. Never delete service record.
  def destroy
    Service.where(service_id: @service.id).first.destroy
    redirect_to services_path(), notice: t("action_messages.destroy", model: Service.model_name.human)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    def set_project
      @project = Project.first
      @regions = Region.all
    end

    def set_children
      @children = Child.all
    end

    # Only allow a trusted parameter "white list" through.
    def service_params
      params.require(:service).permit(:service_type_id, :name, :start_date, :end_date, :description, :service_instances => [])
    end
end
