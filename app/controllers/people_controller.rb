class PeopleController < ApplicationController
  before_action :set_household
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def show
    @person_statuses = Array.new
    intake_work_status_name = @person.intake_work_status.name unless @person.intake_work_status.nil?
    intake_education_status_name = @person.intake_education_status.name unless @person.intake_education_status.nil?
    nh = {
      :status_type => "Intake",
      :work_status => intake_work_status_name,
      :education_status => intake_education_status_name,
      :status_date => @person.created_at,
      :note => ''
    }
    @person_statuses << nh
    @person.follow_ups.order(:created_at).each do |s|
      work_status_name = s.work_status.name unless s.nil? || s.work_status.nil?
      education_status_name = s.education_status.name unless s.nil? || s.education_status.nil?
      @person_statuses << {
        :status_type => "Follow Up",
        :work_status => work_status_name,
        :education_status => education_status_name,
        :status_date => s.created_at,
        :note => ''
      }
    end
  end

  def new
    @person = Person.new
    @person.household = @household
  end

  def create
    @person = Person.new(person_params)

    @person.household_id = @household.id
    @person.age = Time.now.year - @person.dob.year

    if @person.save
      redirect_to household_path(@household), notice: t("action_messages.create", model: Person.model_name.human)
    else
      render :new
    end

  end

  def edit
  end

  def update

    if @person.update_attributes(person_params)
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
      :hours_worked_on_housework, :enrolled_in_school,
      :work_activity_ids => []
    )
  end

end
