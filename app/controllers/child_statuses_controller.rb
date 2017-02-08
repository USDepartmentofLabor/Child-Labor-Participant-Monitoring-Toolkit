class ChildStatusesController < ApplicationController
  before_action :set_child

  def create
    @child_status = ChildStatus.new(child_status_params)
    @child_status.child_id = @child.id
    @child_status.user_id = current_user.id
    @custom_fields = CustomField.where(model_type: "ChildFollowup")

    respond_to do |format|
      if @child_status.save
        if params[:custom_fields].present? && @custom_fields.length > 0
          CustomFieldGroup.create_or_update(@child_status, @custom_fields, params_for_custom_field)
        end
        format.html {
          redirect_to :back, notice: t("action_messages.create", model: ChildStatus.model_name.human)
        }
        format.js
      else
        format.html {
          redirect_to :back,
            alert: t("action_messages.create_failed", model: ChildStatus.model_name.human, error: alert)
        }
        format.js
      end
    end
  end

  private

    def set_child
      @child = Child.find(params[:child_id])
    end

    def child_status_params
      params.require(:child_status).permit(:start_date, :end_date, :work_status_id, :education_status_id, :note,
        :user_id)
    end

    def params_for_custom_field
      params.require(:custom_fields)
    end
end
