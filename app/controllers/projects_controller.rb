class ProjectsController < ApplicationController
  before_action :set_project, only: [:show]

  def show
    
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id

    if @project.save
      redirect_to @project, notice: t("action_messages.create", model: "Project")
    else
      render :new
    end
  end

  private

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name)
    end
end