class ServiceInstancesController < ApplicationController
  before_action :set_child

  def create
    @service_instance = ServiceInstance.new(service_instance_params)
    @service_instance.child_id = @child.id

    if @service_instance.save
      redirect_to :back, notice: t("action_messages.create", model: ServiceInstance.model_name.human)
    else
      redirect_to :back, alert: t("action_messages.create_failed", model: ServiceInstance.model_name.human, error:
alert)
    end
  end

  private

    def set_child
      @child = Child.find(params[:child_id])
    end

    def service_instance_params
      params.require(:service_instance).permit(:start_date, :end_date, :hours, :service_id, :notes, :project_id)
    end
end
