class ServiceInstancesController < ApplicationController
  before_action :set_household
  before_action :set_person

  def create
    @service_instance = ServiceInstance.new(service_instance_params)
    @service_instance.person_id = @person.id

    if @service_instance.save
      redirect_to :back, notice: t("action_messages.create", model: ServiceInstance.model_name.human)
    else
      redirect_to :back, alert: t("action_messages.create_failed", model: ServiceInstance.model_name.human, error:
alert)
    end
  end

  private

    def set_household
      @household = Household.find(params[:household_id])
    end

    def set_person
      @person = Person.find(params[:person_id])
    end

    def service_instance_params
      params.require(:service_instance).permit(:start_date, :end_date, :hours, :service_id, :notes, :project_id)
    end
end
