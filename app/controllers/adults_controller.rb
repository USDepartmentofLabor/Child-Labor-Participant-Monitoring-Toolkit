class AdultsController < ApplicationController
  # GET /adults/1
  def show
    @adult = Adult.find(params[:id])
    @project = Project.first
    @regions = Region.all
    @custom_fields = CustomField.where(model_type: "HouseholdFollowup").with_values(@adult.household_id)
  end

  def update
    @custom_fields = CustomField.where(model_type: "HouseholdFollowup")
    @household = Household.find params[:adult][:household_id]

    if params[:custom_fields].present? && @custom_fields.length > 0
      CustomFieldGroup.create_or_update(@household, @custom_fields, custom_field_params)
      redirect_to household_path(@household), notice: t("action_messages.update", model: Household.model_name.human)
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def adult_params
      params.require(:adult).permit(
        :first_name, :last_name, :middle_name, :sex, :dob, :age, :household_id,
        :intake_date
      )
    end

    def custom_field_params
      params.require(:custom_fields)
    end
end
