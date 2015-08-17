class CustomFieldsController < ApplicationController
  before_action :set_project
  def destroy
    @custom_field = CustomField.find(params[:id])
    if @custom_field.project_id == @project.id && @custom_field.model_type == params[:type]
      @custom_field.destroy
    else
      raise ActiveRecord::RecordNotFound
    end

    respond_to do |format|
      format.html { redirect_to :back, notice: t("action_messages.destroy", model: CustomField.model_name.human) }
      format.js { render :json => {id: @custom_field.id, message: t("action_messages.destroy", model: CustomField.model_name.human)} }
    end
  end
  
  private

  def set_project
    @project = Project.find(params[:project_id])
  end
end