class AdultsController < ApplicationController
  before_action :set_household, only: [:show, :edit, :update]
  before_action :set_adult, only: [:show, :edit, :update, :destroy]

  def show
    @custom_fields = CustomField.where(model_type: "HouseholdFollowup")
  end

  def update
    @custom_fields = CustomField.where(model_type: "HouseholdFollowup")

    if @adult.update_attributes(adult_params)
      if params[:custom_fields].present? && @custom_fields.length > 0
        CustomFieldGroup.create_or_update(@household, @custom_fields, custom_field_params)
      end

      redirect_to household_path(@household), notice: t("action_messages.update", model: Adult.model_name.human)
    else
      render :show
    end
  end

  def destroy
    hh = @adult.household
    @adult.destroy
    redirect_to household_path(hh), notice: t("action_messages.destroy", model: Adult.model_name.human)
  end

  private
    def set_household
      @household = Household.find(params[:household_id])
    end

    def set_adult
      @adult = Adult.find(params[:id])
    end

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
