class CustomFieldsController < ApplicationController
  before_action :set_project
  before_action :set_custom_field, only: [:edit, :update, :destroy]

  def new
    if params[:model_type].blank?
      redirect_to :back, alert: "Failed to specify the model type."
      return
    end
    @model_type = params[:model_type]

    @custom_fields = CustomField.where(project_id: @project.id, model_type: @model_type)
    @custom_field = CustomField.new(project_id: @project.id, model_type: @model_type)
  end

  def edit
  end

  def create
    if params[:custom_field][:model_type].blank?
      redirect_to :back, alert: "Failed to specify the model type."
      return
    end

    @custom_field = CustomField.new(custom_field_params)
    @custom_field.project_id = @project.id

    if @custom_field.save
      redirect_to :back, notice: t("action_messages.create", model: CustomField.model_name.human)
    end
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
    if @custom_field.project_id != @project.id
      raise ActiveRecord::RecordNotFound
    end
    @custom_field
  end

  def custom_field_params
    params.require(:custom_field).permit(:name, :field_type, :selections, :model_type)
  end
end