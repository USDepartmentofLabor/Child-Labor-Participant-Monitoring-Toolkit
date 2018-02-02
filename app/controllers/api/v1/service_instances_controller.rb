class Api::V1::ServiceInstancesController < Api::ApiController
  before_filter :ensure_user_allowed
  before_action :set_service_instance, only: [:show, :update]

  # GET /api/v1/service_instances
  def index
    render json: ServiceInstance.all.to_json
  end

  # GET /api/v1/service_instances/1
  def show
    render json: @service_instance.to_json
  end

  # POST /api/v1/service_instances
  def create
    @service_instance = ServiceInstance.new(service_instance_params)
    if @service_instance.save
      render json: '{"status":"success","updated_at":"' +
        get_datetime_formatted(@service_instance.updated_at) +
        '","created_at":"' +
        get_datetime_formatted(@service_instance.created_at) +
        '","id":"' + @service_instance.id.to_s + '"}'
    else
      render json: '{"status":"failure"}'
    end
  end

  # PUT /api/v1/service_instances/1
  def update
    if @service_instance.update(service_instance_params)
      render json: '{"status":"success", "updated_at":"' +
      get_datetime_formatted(@service_instance.updated_at) + '"}'
    else
      render json: '{"status":"failure"}'
    end
  end

  private

  def set_service_instance
    @service_instance = ServiceInstance.find(params[:id])
  end

  def service_instance_params
    params.require(:service_instance).permit(:start_date, :end_date, :hours, :service_id, :notes, :person_id)
  end

end