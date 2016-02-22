class ChildrenController < ApplicationController
  before_action :set_project
  before_action :set_child, only: [:show, :edit, :update, :destroy]

  # GET /children
  def index
		@children = @project.children

    @search = @project.children.ransack(params[:q])
    @search.build_condition
  end

  def search
    @search = @project.children.ransack(params[:q])
    @children = @search.result(distinct: true)
  end

  # GET /children/1
  def show
    @child_statuses = ChildStatus.where(child_id: @child.id, project_id: @project.id).includes(:work_status, :education_status)
    @service_instances = ServiceInstance.where(child_id: @child.id, project_id: @project.id).includes(:service)
    @custom_fields = CustomField.where(model_type: "Child").with_values(@child.id)
  end

  # GET /children/new
  def new
    @child = Child.new
    @custom_fields = CustomField.where(model_type: "Child")
  end

  # GET /children/1/edit
  def edit
    @custom_fields = CustomField.where(model_type: "Child").with_values(@child.id)
  end

  # POST /children
  def create
    @child = Child.new(child_params)
    @custom_fields = CustomField.where(model_type: "Child")

    if @child.save
      @project.children << @child

      if params[:custom_fields].present? && @custom_fields.length > 0
        CustomFieldGroup.create_or_update(@child, @custom_fields, params_for_custom_field)
      end

      redirect_to new_project_child_path(@project), notice: t("action_messages.create", model: Child.model_name.human)
    else
      render :new
    end
  end

  # PATCH/PUT /children/1
  def update
    @custom_fields = CustomField.where(model_type: "Child")
    if @child.update(child_params)
      if params[:custom_fields].present? && @custom_fields.length > 0
        CustomFieldGroup.create_or_update(@child, @custom_fields, params_for_custom_field)
      end
      redirect_to project_child_path(@project, @child), notice: t("action_messages.update", model: Child.model_name.human)
    else
      render :edit
    end
  end

  # only delete child-project relation. Never delete child record.
  def destroy
    ProjectsChild.where(project_id: @project.id, child_id: @child.id).first.destroy
    redirect_to project_children_path(@project), notice: t("action_messages.destroy", model: Child.model_name.human)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_child
      @child = @project.children.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
      @project_regions = @project.project_regions
    end

    # Only allow a trusted parameter "white list" through.
    def child_params
      params.require(:child).permit(:fname, :lname, :mname, :sex, :dob, :address, :city, :state, :country, :household_id, :avatar)
    end

    def params_for_custom_field
      params.require(:custom_fields)
    end
end
