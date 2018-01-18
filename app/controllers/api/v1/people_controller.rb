class Api::V1::PeopleController < Api::ApiController
  before_filter :ensure_user_allowed
  before_action :set_person, only: [:show, :update]

  # GET /api/v1/people  
  def index
    render json: Person.all.to_json
  end

  # GET /api/v1/people/1
  def show
    render json: @person.to_json
  end

  # POST /api/v1/people
  def create
    @household = Household.find(person_params[:household_id])    
    if @person = @household.people.create(person_params)
      render json: '{"status":"success","updated_at":"' +
        get_datetime_formatted(@person.updated_at) +
        '","created_at":"' +
        get_datetime_formatted(@person.created_at) +
        '","id":"' + @person.id.to_s + '"}'
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

  def set_person
    @person = Person.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def person_params
    params.require(:person).permit(
      :first_name, :last_name, :middle_name, :sex, :dob, :household_id,
      :intake_date, :relationship_id, :relationship_other, :have_job_returning_to,
      :hours_worked, :hours_worked_on_housework, :enrolled_in_school,
      :is_birthdate_approximate)      
  end

end