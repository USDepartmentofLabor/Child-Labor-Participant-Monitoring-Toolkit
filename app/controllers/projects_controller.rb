class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :gender_count]

  def show
    @total_children = @project.children.count
    @total_households = @project.households.count

    if @total_children == 0 && @total_households == 0
      render "show_init"
    else
      render "show"
    end
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id

    if @project.save
      redirect_to @project, notice: t("action_messages.create", model: Project.model_name.human)
    else
      render :new
    end
  end

  def gender_count
    count_in_sex = @project.children.group(:sex).count
    res = {}
    res[Child.gender_name(1)] = count_in_sex[1] || 0
    res[Child.gender_name(2)] = count_in_sex[2] || 0

    respond_to do |format|
      format.json {render json: res}
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