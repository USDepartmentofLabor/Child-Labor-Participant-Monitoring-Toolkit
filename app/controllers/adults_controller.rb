class AdultsController < ApplicationController
  before_action :set_adult, only: [:show, :edit, :update, :destroy]
  before_action :set_hoh, only: [:create, :update]

  def update
    if @adult.update_attributes(adult_params)
      redirect_to household_path(@adult.household),
        notice: t("action_messages.update", model: Adult.model_name.human)
    else
      render :show
    end
  end

  def destroy
    hh = @adult.household
    @adult.destroy
    redirect_to household_path(hh),
      notice: t("action_messages.destroy", model: Adult.model_name.human)
  end

  private
    def set_adult
      @adult = Adult.find(params[:id])
    end

    def set_hoh
      if(@adult.relationship_id)
        r = Relationship.find(@adult.relationship_id)
        @adult.is_head_of_household = (r && r.canonical_name == 'HEAD')
      else
        @adult.is_head_of_household = false
      end
    end

    # Only allow a trusted parameter "white list" through.
    def adult_params
      params.require(:adult).permit(
        :first_name, :last_name, :middle_name, :sex, :dob, :age,
        :intake_date, :relationship_id, :relationship_other
      )
    end
end
