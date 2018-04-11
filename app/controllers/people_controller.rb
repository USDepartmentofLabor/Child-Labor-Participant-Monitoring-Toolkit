class PeopleController < ApplicationController
  before_action :set_household
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def show
    if ! CustomSection.where(model_type: 'Person', sort_order: 1).empty?
      @section_1_custom_fields = CustomSection.where(model_type: 'Person', sort_order: 1).first.custom_fields
    else
      @section_1_custom_fields = Array.new
    end
    @sections = CustomSection.where('model_type = ? AND sort_order > ?', 'Person', 1)

    @person_statuses = Array.new
    intake_work_status_name = @person.intake_work_status.name unless @person.intake_work_status.nil?
    intake_education_status_name = @person.intake_education_status.name unless @person.intake_education_status.nil?
    nh = {
      :status_id => 0,
      :status_type => "Intake",
      :work_status => intake_work_status_name,
      :education_status => intake_education_status_name,
      :status_date => @person.intake_date,
      :reporting_period => @person.intake_reporting_period.name
    }
    @person_statuses << nh
    @person.follow_ups.order(:created_at).each do |s|
      work_status_name = s.work_status.name unless s.nil? || s.work_status.nil?
      education_status_name = s.education_status.name unless s.nil? || s.education_status.nil?
      @person_statuses << {
        :status_id => s.id,
        :status_type => "Follow Up",
        :work_status => work_status_name,
        :education_status => education_status_name,
        :status_date => s.follow_date,
        :reporting_period => s.reporting_period.name
      }
    end
    @service_instances = @person.service_instances.includes(:service)
  end

  def new
    @person = Person.new
    @person.household = @household
    @section_1_custom_fields = CustomSection.where(model_type: 'Person', sort_order: 1).first.custom_fields unless CustomSection.where(model_type: 'Person', sort_order: 1).empty?
    @sections = CustomSection.where('model_type = ? AND sort_order > ?', 'Person', 1)
  end

  def create
    @person = Person.new(person_params)
    @custom_fields = CustomField.where(model_type: "Person")

    @person.household_id = @household.id
    @person.age = Time.now.year - @person.dob.year

    if @person.save
      if params[:custom_fields].present? && @custom_fields.length > 0
        CustomFieldGroup.create_or_update(@person, @custom_fields, params_for_custom_field)
      end

      redirect_to household_path(@household), notice: t("action_messages.create", model: Person.model_name.human)
    else
      render :new
    end

  end

  def edit
    @section_1_custom_fields = CustomSection.where(model_type: 'Person', sort_order: 1).first.custom_fields unless CustomSection.where(model_type: 'Person', sort_order: 1).empty?
    @sections = CustomSection.where('model_type = ? AND sort_order > ?', 'Person', 1)
  end

  def update
    @custom_fields = CustomField.where(model_type: "Person")

    if @person.update_attributes(person_params)
      if params[:custom_fields].present? && @custom_fields.length > 0
        CustomFieldGroup.create_or_update(@person, @custom_fields, params_for_custom_field)
      end

      @person.age = Time.now.year - @person.dob.year
      @person.save
      redirect_to household_person_path(@household, @person), notice: t("action_messages.update", model: Person.model_name.human)
    else
      render :edit
    end

  end

  def destroy
    @person.destroy
    redirect_to households_path(), notice: t("action_messages.destroy", model: Person.model_name.human)
  end

  private

  def set_household
    @household = Household.find(params[:household_id])
  end

  def set_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(
      :first_name, :last_name, :middle_name, :sex,
      :dob, :is_birthdate_approximate, :age, :household_id,
      :intake_date, :did_work, :have_job_returning_to,
      :hours_worked, :occupation_id, :industry_id,
      :exposed_to_hazardous_condition, :subject_to_abuses, :performed_housework,
      :hours_worked_on_housework, :enrolled_in_school, :relationship_id,
      :relationship_other,
      :work_activity_ids => [],
      :hazardous_condition_ids => [],
      :household_task_ids => []
    )
  end

  def params_for_custom_field
    params.require(:custom_fields)
  end

end
