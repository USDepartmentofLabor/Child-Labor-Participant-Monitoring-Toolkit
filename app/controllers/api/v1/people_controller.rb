class Api::V1::PeopleController < Api::ApiController
  before_filter :ensure_user_allowed

  # GET /api/people
  def index
    if Person.count.zero?
      render json: '[]'
    else
      json = '['
      for person in Person.all do
        json << get_person_as_json(person) + ','
      end
      json = json.chop
      json << ']'
      render json: json
    end
  end

  # GET /api/people/1
  def show
    if Person.exists?(params[:id])
      set_person
      render json: get_person_as_json(@person)
    else
      render status: 404, json: '{"status":"failure"}'
    end
  end

  # POST /api/v1/people
  def create
    if !validate_request
      render status: 400, json: '{"status":"failure"}'
      return
    end

    @household = Household.find(person_params[:household_id])
    if @person = @household.people.create(person_params)
      @person.work_activity_ids << person_params[:work_activity_ids]
      @person.hazardous_condition_ids << person_params[:hazardous_condition_ids]
      @person.household_task_ids << person_params[:household_task_ids]
      if @person.save
        render status: 201, json: '{"status":"success","updated_at":"' +
          get_datetime_formatted(@person.updated_at) + '","created_at":"' +
          get_datetime_formatted(@person.created_at) + '","id":"' +
          @person.id.to_s + '"}'
      else
        render status: 500, json: '{"status":"failure"}'
      end
    else
      render status: 500, json: '{"status":"failure"}'
    end
  end

  # PUT /api/people/1
  def update
    if Person.exists?(params[:id])
      set_person
      if !validate_request
        render status: 400, json: '{"status":"failure"}'
        return
      end
      if @person.update(person_params)
        render json: '{"status":"success", "updated_at":"' +
          get_datetime_formatted(@person.updated_at) + '"}'
      else
        render status: 500, json: '{"status":"failure"}'
      end
    else
      render status: 404, json: '{"status":"failure"}'
    end
  end

  private

  def validate_request
    # check if relationship_id is valid if not null
    if person_params[:relationship_id].present?
      if !Relationship.exists?(person_params[:relationship_id])
        return false
      end
    end

    # check if household_id is valid
    if person_params[:household_id].present?
      if !Household.exists?(person_params[:household_id])
        return false
      end
    end

    # do not allow null household_id
    if person_params[:household_id].blank?
      return false
    end

    return true
  end

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
