class CustomFieldsController < ApplicationController
  before_action :set_project
  before_action :set_custom_field, only: [:edit, :update, :destroy]

  def edit
  end

  def update
    @custom_field.update(custom_field_params)

    respond_to do |format|
      format.html { redirect_to :back, notice: t("action_messages.update", model: CustomField.model_name.human) }
    end
  end

  def destroy
    @custom_field.destroy

    respond_to do |format|
      format.html { redirect_to :back, notice: t("action_messages.destroy", model: CustomField.model_name.human) }
      format.js { render json: {id: @custom_field.id, message: t("action_messages.destroy", model: CustomField.model_name.human)} }
      format.json { render json: {id: @custom_field.id, message: t("action_messages.destroy", model: CustomField.model_name.human)} }
    end
  end
  
  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_custom_field
    @custom_field = CustomField.find(params[:id])
    if @custom_field.project_id != @project.id || @custom_field.model_type != params[:type]
      raise ActiveRecord::RecordNotFound
    end
    @custom_field
  end

  def custom_field_params
    params.require(:custom_field).permit(:name, :field_type, :selections)
  end
end