class FollowUpsController < ApplicationController
  before_action :set_household
  before_action :set_person
  before_action :set_follow_up, only: [:show, :edit, :update, :destroy]

  def show
    if ! CustomSection.where(model_type: 'FollowUp', sort_order: 1).empty?
      @section_1_custom_fields = CustomSection.where(model_type: 'FollowUp', sort_order: 1).first.custom_fields
    else
      @section_1_custom_fields = Array.new
    end
    @sections = CustomSection.where('model_type = ? AND sort_order > ?', 'FollowUp', 1)
  end

  def new
    @follow_up = FollowUp.new
    @section_1_custom_fields = CustomSection.where(model_type: 'FollowUp', sort_order: 1).first.custom_fields unless CustomSection.where(model_type: 'FollowUp', sort_order: 1).empty?
    @sections = CustomSection.where('model_type = ? AND sort_order > ?', 'FollowUp', 1)
  end

  def create
    @follow_up = FollowUp.new(follow_up_params)
    @custom_fields = CustomField.where(model_type: "FollowUp")

    @follow_up.person_id = @person.id

    if @follow_up.enrolled_in_school
      @follow_up.education_status_id = 1
    end

    if @person.age and @person.age >= 5 and @person.age <= 17
      if @follow_up.work_activities.any? || @follow_up.have_job_returning_to
        if @follow_up.hazardous_conditions.any?
           @follow_up.work_status_id = 2
        elsif (@person.age >= 5 && @person.age <= 14) && @follow_up.hours_worked > 14
          @follow_up.work_status_id = 1
        elsif @person.age <= 17 and @follow_up.hours_worked > 40
          @follow_up.work_status_id = 1
        end

      end
    end

    if @follow_up.save
      if params[:custom_fields].present? && @custom_fields.length > 0
        CustomFieldGroup.create_or_update(@follow_up, @custom_fields, params_for_custom_field)
      end

      redirect_to household_person_path(@household, @person), notice: t("action_messages.create", model: FollowUp.model_name.human)
    else
      render :new
    end

  end

  def edit
    @section_1_custom_fields = CustomSection.where(model_type: 'FollowUp', sort_order: 1).first.custom_fields unless CustomSection.where(model_type: 'FollowUp', sort_order: 1).empty?
    @sections = CustomSection.where('model_type = ? AND sort_order > ?', 'FollowUp', 1)
  end

  def update
    @custom_fields = CustomField.where(model_type: "FollowUp")

    if @follow_up.update_attributes(follow_up_params)
      if params[:custom_fields].present? && @custom_fields.length > 0
        CustomFieldGroup.create_or_update(@follow_up, @custom_fields, params_for_custom_field)
      end

      redirect_to household_person_path(@household, @person), notice: t("action_messages.update", model: FollowUp.model_name.human)
    else
      render :edit
    end

  end

  def destroy
    @follow_up.destroy
    redirect_to households_path(), notice: t("action_messages.destroy", model: FollowUp.model_name.human)
  end

  private

  def set_household
    @household = Household.find(params[:household_id])
  end

  def set_person
    @person = Person.find(params[:person_id])
  end

  def follow_up_params
    params.require(:follow_up).permit(
      :follow_date, :did_work, :have_job_returning_to, :hours_worked, :occupation_id, :industry_id,
      :exposed_to_hazardous_condition, :subject_to_abuses, :performed_housework,
      :hours_worked_on_housework, :enrolled_in_school,
      :work_activity_ids => [],
      :hazardous_condition_ids => [],
      :household_task_ids => []
    )
  end

  def params_for_custom_field
    params.require(:custom_fields)
  end

end
