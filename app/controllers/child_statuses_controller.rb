class ChildStatusesController < ApplicationController
  before_action :set_child

  def create
    @child_status = ChildStatus.new(child_status_params)
    @child_status.child_id = @child.id
    @child_status.user_id = current_user.id

    if @child_status.save
      redirect_to :back, notice: t("action_messages.create", model: ChildStatus.model_name.human)
    else
      redirect_to :back, alert: t("action_messages.create_failed", model: ChildStatus.model_name.human, error: alert)
    end
  end

  private

    def set_child
      @child = Child.find(params[:child_id])
    end

    def child_status_params
      params.require(:child_status).permit(:start_date, :end_date, :work_status_id, :education_status_id, :note)
    end
end
