class PeopleController < ApplicationController
  before_action :set_household
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def show
    @person_statuses = Array.new
    intake_status = @person.intake_status
    intake_work_status_name = intake_status.work_status.name unless intake_status.work_status.nil? || intake_status.work_status.nil?
    intake_education_status_name = intake_status.education_status.name unless intake_status.nil? || intake_status.education_status.nil?
    nh = { 
      :status_type => "Intake", 
      :work_status => intake_work_status_name,
      :education_status => intake_education_status_name,
      :status_date => intake_status.created_at,
      :note => intake_status.note
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

      work_status_id = -1
      if @person.age >= 5 and @person.age <= 17
        if @person.did_work || @person.have_job_returning_to
          if @person.occupation_id.present? || 
            @person.industry_id.present? || 
            @person.exposed_to_hazardous_condition
            @person.subject_to_abuses

            work_status_id = 2
          elsif (@person.age >= 5 && @person.age <= 14) && @person.hours_worked > 14
            work_status_id = 1
          elsif @person.age <= 17 and @person.hours_worked > 40
            work_status_id = 1
          end

        end
      end

      education_status_id = -1
      if @person.enrolled_in_school
        education_status_id = 1
      end

      ChildStatus.create!(
        work_status_id: work_status_id,
        education_status_id: education_status_id,
        start_date: @person.intake_date,
        end_date: @person.intake_date,
        child_id: @person.id,
        user_id: current_user.id
      )


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
      :first_name, :last_name, :middle_name, :sex, :dob, :age, :household_id,
      :intake_date, :did_work, :have_job_returning_to, :hours_worked, :occupation_id, :industry_id,
      :exposed_to_hazardous_condition, :subject_to_abuses, :performed_housework, 
      :hours_worked_on_housework, :enrolled_in_school
    )
  end

end
