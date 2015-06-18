class HouseholdsController < ApplicationController
  before_action :set_project
  before_action :set_household, only: [:show, :edit, :update, :destroy]

  # GET /households
  def index
    @households = @project.households.order(:id).page(params[:page])
  end

  # GET /households/1
  def show
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
      redirect_to @household, notice: 'Household was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /households/1
  def update
    if @household.update(household_params)
      redirect_to @household, notice: 'Household was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /households/1
  def destroy
    @household.destroy
    redirect_to households_url, notice: 'Household was successfully destroyed.'
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
      params.require(:household).permit(:name, :address, :city, :state, :country, :phone)
    end
end
