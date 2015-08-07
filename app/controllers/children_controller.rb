class ChildrenController < ApplicationController
  before_action :set_project
  before_action :set_child, only: [:show, :edit, :update, :destroy]

  # GET /children
  def index
    @children = @project.children.order("id DESC").page(params[:page])

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
  end

  # GET /children/new
  def new
    @child = Child.new
  end

  # GET /children/1/edit
  def edit
  end

  # POST /children
  def create
    @child = Child.new(child_params)

    if @child.save
      @project.children << @child
      redirect_to project_child_path(@project, @child), notice: t("action_messages.create", model: Child.model_name.human)
    else
      render :new
    end
  end

  # PATCH/PUT /children/1
  def update
    if @child.update(child_params)
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

  def new_fields
    @custom_field = CustomField.new(project_id: @project.id, model_type: "Child")
  end

  def create_fields
    @custom_field = CustomField.new(custom_field_params)
    @custom_field.project_id = @project.id
    @custom_field.model_type = "Child"

    if @custom_field.save
      redirect_to :back, notice: t("action_messages.create", model: CustomField.model_name.human)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_child
      @child = @project.children.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    # Only allow a trusted parameter "white list" through.
    def child_params
      params.require(:child).permit(:fname, :lname, :mname, :sex, :dob, :address, :city, :state, :country, :household_id, :avatar)
    end

    def custom_field_params
      params.require(:custom_field).permit(:name, :field_type, :selections)
    end
end
