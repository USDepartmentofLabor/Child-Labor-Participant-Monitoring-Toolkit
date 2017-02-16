class AdultsController < ApplicationController
  # GET /adults/1
  def show
    @adult = Adult.find(params[:id])
    @project = Project.first
    @regions = Region.all
    @custom_fields = CustomField.where(model_type: "Adult").with_values(@adult.id)
    @custom_status_fields = CustomField.where(model_type: "AdultFollowup").with_values(@adult.id)
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
