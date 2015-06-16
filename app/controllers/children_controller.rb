class ChildrenController < ApplicationController
  before_action :set_project
  before_action :set_child, only: [:show, :edit, :update, :destroy]

  # GET /children
  def index
    @children = @project.children.order(:id).page(params[:page])
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
      redirect_to project_child_path(@project, @child), notice: t("action_messages.create", model: "Child")
    else
      render :new
    end
  end

  # PATCH/PUT /children/1
  def update
    if @child.update(child_params)
      redirect_to project_child_path(@project, @child), notice: t("action_messages.update", model: "Child")
    else
      render :edit
    end
  end

  # only delete child-project relation. Never delete child record.
  def destroy
    ProjectsChild.where(project_id: @project.id, child_id: @child.id).first.destroy
    redirect_to project_children_path(@project), notice: t("action_messages.destroy", model: "Child")
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
      params.require(:child).permit(:fname, :lname, :mname, :sex, :dob, :address, :city, :state, :country)
    end
end
