class HouseholdsController < ApplicationController
  before_action :set_project
  before_action :set_household, only: [:show, :edit, :update, :destroy]

  # GET /households
  def index
    @households = @project.households.order(:id).page(params[:page])
  end

  # GET /households/1
  def show
    @children = @household.children
  end

  # GET /households/new
  def new
    @household = Household.new
  end

  # GET /households/1/edit
  def edit
  end

  # POST /households
  def create
    @household = Household.new(household_params)

    if @household.save
      @project.households << @household

      @household.children.each{|child| @project.children << child}

      redirect_to project_household_path(@project, @household), notice: t("action_messages.create", model: "Household")
    else
      render :new
    end
  end

  # PATCH/PUT /households/1
  def update
    if @household.update(household_params)
      redirect_to project_household_path(@project, @household), notice: t("action_messages.update", model: "Household")
    else
      render :edit
    end
  end

  # DELETE /households/1
  def destroy
    @household.destroy
    redirect_to project_households_path(@project), notice: 'Household was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_household
      @household = @project.households.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    # Only allow a trusted parameter "white list" through.
    def household_params
      params.require(:household).permit(
        :name, :address, :city, :state, :country, :phone,
        children_attributes: [:fname, :lname, :mname, :sex, :dob, :_destroy]
      )
    end
end
