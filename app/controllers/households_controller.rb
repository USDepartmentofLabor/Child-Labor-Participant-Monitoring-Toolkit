class HouseholdsController < ApplicationController
  before_action :set_project
  before_action :set_household, only: [:show, :edit, :update, :destroy]

  # GET /households
  def index
		@households = @project.households
  end

  # GET /households/1
  def show
    @children = @household.children
    @adults = @household.adults
    @custom_fields = CustomField.where(project_id: @project.id, model_type: "Household").with_values(@household.id)
  end

  # GET /households/new
  def new
    @household = Household.new
    @custom_fields = CustomField.where(project_id: @project.id, model_type: "Household")
  end

  # GET /households/1/edit
  def edit
    @custom_fields = CustomField.where(project_id: @project.id, model_type: "Household").with_values(@household.id)
  end

  # POST /households
  def create
    @household = Household.new(household_params)
    @custom_fields = CustomField.where(project_id: @project.id, model_type: "Household")

    if @household.save
      @project.households << @household
      @household.children.each{|child| @project.children << child}

      if params[:custom_fields].present? && @custom_fields.length > 0
        CustomFieldGroup.create_or_update(@household, @custom_fields, params_for_custom_field)
      end

      respond_to do |format|
        format.html {redirect_to project_household_path(@project, @household), notice: t("action_messages.create", model: Household.model_name.human)}
        format.js
      end
    else
      render :new
    end
  end

  # PATCH/PUT /households/1
  def update
    @custom_fields = CustomField.where(project_id: @project.id, model_type: "Household")
    if @household.update_attributes(household_params)
      if params[:custom_fields].present? && @custom_fields.length > 0
        CustomFieldGroup.create_or_update(@household, @custom_fields, params_for_custom_field)
      end
      
      redirect_to project_household_path(@project, @household), notice: t("action_messages.update", model: Household.model_name.human)
    else
      render :edit
    end
  end

  # DELETE /households/1
  def destroy
    @household.destroy
    redirect_to project_households_path(@project), notice: t("action_messages.destroy", model: Household.model_name.human)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_household
      @household = @project.households.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
      @project_regions = @project.project_regions
    end

    # Only allow a trusted parameter "white list" through.
    def household_params
      params.require(:household).permit(
        :name, :address, :city, :state, :country, :phone,
        children_attributes: [:fname, :lname, :mname, :sex, :dob, :_destroy, :id],
        adults_attributes: [:fname, :lname, :mname, :sex, :dob, :_destroy, :id]
      )
    end

    def params_for_custom_field
      params.require(:custom_fields)
    end
end
