class ServicesController < ApplicationController
  before_action :set_project
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  # GET /services
  def index
    @services = @project.services.order(:name).page(params[:page])

    @search = @project.services.ransack(params[:q])
    @search.build_condition
  end

  def search
    @search = @project.services.ransack(params[:q])
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
      @project.services << @service

      redirect_to new_project_service_path(@project), notice: t("action_messages.create", model: Service.model_name.human)
    else
      render :new
    end
  end

  # PATCH/PUT /services/1
  def update
    if @service.update(service_params)
      redirect_to project_service_path(@project, @service), notice: t("action_messages.update", model: Service.model_name.human)
    else
      render :edit
    end
  end

  # only delete service-project relation. Never delete service record.
  def destroy
    ProjectsService.where(project_id: @project.id, service_id: @service.id).first.destroy
    redirect_to project_services_path(@project), notice: t("action_messages.destroy", model: Service.model_name.human)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = @project.services.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
      @project_regions = @project.project_regions
    end

    # Only allow a trusted parameter "white list" through.
    def service_params
      params.require(:service).permit(:service_type_id, :name, :start_date, :end_date, :description, :beneficiary_ids => [])
    end
end
