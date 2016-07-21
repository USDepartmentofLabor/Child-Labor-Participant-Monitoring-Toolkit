class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :dashboard, :gender_count, :edit, :update]

  def dashboard
    redirect_to 'new' if @project.nil?

    @total_children = Child.count
    @total_households = Household.count

    total_children_target = @project.project_targets.find_by(project_target_type_id: 1)
    if total_children_target
      @total_children_target = total_children_target.target.to_i
      @total_children_percentage = (@total_children.to_f / @total_children_target.to_f) * 100.0
    else
      @total_children_target = 0
      @total_children_percentage = 0
    end

    total_households_target = @project.project_targets.find_by(project_target_type_id: 3)
    if total_households_target
      @total_households_target = total_households_target.target.to_i
      @total_households_percentage = (@total_households.to_f / @total_households_target.to_f) * 100.0
    else
      @total_households_target = 0
      @total_households_percentage = 0
    end

    @total_services = Service.count

    @project_complete_percentage = (Date.today.mjd - @project.start_date.mjd) / (@project.end_date.mjd - @project.start_date.mjd).to_f * 100.0

    @new_children = Child.order('RANDOM()').limit(8) # TODO: Get non-random children

    if @total_children == 0 && @total_households == 0
      redirect_to @project
    else
      render 'dashboard'
    end
  end

  def show
    @location = Location.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @project.update_attributes(project_params)
        format.html {
          redirect_to(@project, notice: t('action_messages.update', model: Project.model_name.human))
        }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def gender_count
    count_in_sex = @project.children.group(:sex).count
    res = {}
    res[Child.gender_name(1)] = count_in_sex[1] || 0
    res[Child.gender_name(2)] = count_in_sex[2] || 0

    respond_to do |format|
      format.json { render json: res }
    end
  end

  private

  def set_project
    @project = Project.joins(:locations, :project_targets, :region).first
  end

  def project_params
    params.require(:project).permit(
      :name, :title, :cooperative_agreement_number, :start_date,
      :end_date, :organization, :funding_amount, :region_id,
      project_targets_attributes: [
        :id, :project_target_type_id, :target, :_destroy
      ],
      locations_attributes: [
        :id, :name, :location_type_id, :address_line1, :address_line2, :city,
        :state, :zip, :country, :_destroy
      ]
    )
  end
end
