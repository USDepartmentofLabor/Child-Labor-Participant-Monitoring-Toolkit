class Api::V1::PeopleController < Api::ApiController
  before_filter :ensure_user_allowed
  before_action :set_person, only: [:show, :update]

  # GET /api/v1/people  
  def index
    json = '['
    for person in Person.all do
      json << get_person_as_json(person) + ','
    end
    json = json.chop
    json << ']'
    render json: json
  end

  # GET /api/v1/people/1
  def show
    render json: get_person_as_json(@person)
  end

  # POST /api/v1/people
  def create
    @household = Household.find(person_params[:household_id])      
    if @person = @household.people.create(person_params)      
      @person.work_activity_ids << person_params[:work_activity_ids]
      @person.hazardous_condition_ids << person_params[:hazardous_condition_ids]
      @person.household_task_ids << person_params[:household_task_ids] 
      if @person.save
        render json: '{"status":"success","updated_at":"' +
          get_datetime_formatted(@person.updated_at) +
          '","created_at":"' +
          get_datetime_formatted(@person.created_at) +
          '","id":"' + @person.id.to_s + '"}'
      else
        render json: '{"status":"failure"}'
      end
    else
      render json: '{"status":"failure"}'
    end      
  end
  
  # PUT /api/v1/people/1
  def update   
    if @person.update(person_params)
      render json: '{"status":"success", "updated_at":"' +
        get_datetime_formatted(@person.updated_at) + '"}'
    else
      render json: '{"status":"failure"}'
    end
  end

  private

  def get_person_as_json(person)
    return person.to_json.chop + ',"work_activity_ids":' +
      person.work_activity_ids.to_s + ',"hazardous_condition_ids":' +
      person.hazardous_condition_ids.to_s + ',"household_task_ids":' +
      person.household_task_ids.to_s + '}'
  end

  def set_person
    @person = Person.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def person_params
    params.require(:person).permit(
      :first_name, :last_name, :middle_name, :sex, :dob, :household_id,
      :intake_date, :relationship_id, :relationship_other, :have_job_returning_to,
      :hours_worked, :hours_worked_on_housework, :enrolled_in_school,
      :is_birthdate_approximate, :latitude, :longitude, :position_accuracy,
      :altitude, :altitude_accuracy, :heading, :speed, :gps_recorded_at,
      :work_activity_ids => [],
      :hazardous_condition_ids => [],
      :household_task_ids => [])
  end

end