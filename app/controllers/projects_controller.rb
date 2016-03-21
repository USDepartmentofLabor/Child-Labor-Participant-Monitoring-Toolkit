class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :gender_count, :update]

  def show
    if @project.nil?
      redirect_to "new"
    end

    @total_children = Child.count
    @total_households = Household.count

    total_children_target = @project.project_targets.find_by(project_target_type_id: 1)
    if total_children_target
      @total_children_target = total_children_target.total
      @total_children_percentage = (@total_children.to_f / @total_children_target.to_f) * 100.0
    else
      @total_children_target = 0
      @total_children_percentage = 0
    end

    total_households_target = @project.project_targets.find_by(project_target_type_id: 3)
    if total_households_target
      @total_households_target = total_households_target.target
      @total_households_percentage = (@total_households.to_f / @total_households_target.to_f) * 100.0
    else
      @total_households_target = 0
      @total_households_percentage = 0
    end

    @total_services = Service.count

    if @total_children == 0 && @total_households == 0
      render "show_init"
    else
      render "show"
    end
  end

  def new
    @project = Project.new
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

  def update
    @project.update(project_params)
    redirect_to @project, notice: t("action_messages.update", model: Project.model_name.human)
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
    @project = Project.first
  end

  def project_params
    params.require(:project).permit(
      :name, :title, :cop_num, :start_date, :end_date, :org, :proj_type, :funding, :office_address,
      :total_target_children, project_regions_attributes: [:country, :state, :id, :_destroy]
    )
  end
end
