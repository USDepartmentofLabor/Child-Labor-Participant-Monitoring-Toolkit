class Api::V1::ServiceInstancesController < Api::ApiController
  before_filter :ensure_user_allowed

  # GET /api/service_instances
  def index
    render json: ServiceInstance.all.to_json
  end

  # GET /api/service_instances/1
  def show
    if ServiceInstance.exists?(params[:id])
      set_service_instance
      render json: @service_instance.to_json
    else
      render status: 404, json: '{"status":"failure"}'
    end
  end

  # POST /api/service_instances
  def create
    if !validate_request
      render status: 400, json: '{"status":"failure"}'
      return
    end

    @service_instance = ServiceInstance.new(service_instance_params)
    if @service_instance.save
      render status: 201, json: '{"status":"success","updated_at":"' +
        get_datetime_formatted(@service_instance.updated_at) +
        '","created_at":"' +
        get_datetime_formatted(@service_instance.created_at) + '","id":"' +
        @service_instance.id.to_s + '"}'
    else
      render status: 500, json: '{"status":"failure"}'
    end
  end

  # PUT /api/service_instances/1
  def update
    if ServiceInstance.exists?(params[:id])
      set_service_instance

      if !validate_request
        render status: 400, json: '{"status":"failure"}'
        return
      end

      if @service_instance.update(service_instance_params)
        render json: '{"status":"success", "updated_at":"' +
          get_datetime_formatted(@service_instance.updated_at) + '"}'
      else
        render status: 500, json: '{"status":"failure"}'
      end
    else
      render status: 404, json: '{"status":"failure"}'
    end
  end

  private

  def validate_request
    # check if person_id is valid
    if service_instance_params[:person_id].present?
      if !Person.exists?(service_instance_params[:person_id])
        return false
      end
    end

    # do not allow null person_id
    if service_instance_params[:person_id].blank?
      return false
    end

    # check if service_id is valid
    if service_instance_params[:service_id].present?
      if !Service.exists?(service_instance_params[:service_id])
        return false
      end
    end

    # do not allow null service_id
    if service_instance_params[:service_id].blank?
      return false
    end

    return true
  end

  def set_service_instance
    @service_instance = ServiceInstance.find(params[:id])
  end

  def service_instance_params
    params.require(:service_instance).permit(
      :start_date, :end_date, :hours, :service_id, :notes, :person_id)
  end

end
