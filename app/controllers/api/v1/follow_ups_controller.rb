class Api::V1::FollowUpsController < Api::ApiController
  before_filter :ensure_user_allowed
  before_action :set_follow_up, only: [:show, :update]

  # GET /api/v1/follow_ups  
  def index
    json = '['
    for follow_up in FollowUp.all do
      json << get_follow_up_as_json(follow_up) + ','
    end
    json = json.chop
    json << ']'
    render json: json
  end

  # GET /api/v1/follow_ups/1
  def show
    render json: get_follow_up_as_json(@follow_up)
  end

  # POST /api/v1/follow_ups
  def create
    @follow_up = FollowUp.new(follow_up_params)
    if @follow_up.save            
      render json: '{"status":"success","updated_at":"' +
        get_datetime_formatted(@follow_up.updated_at) +
        '","created_at":"' +
        get_datetime_formatted(@follow_up.created_at) +
        '","id":"' + @follow_up.id.to_s + '"}'
    else
      render json: '{"status":"failure"}'
    end      
  end

  # PUT /api/v1/people/1
  def update   
    if @follow_up.update(follow_up_params)
      render json: '{"status":"success", "updated_at":"' +
        get_datetime_formatted(@follow_up.updated_at) + '"}'
    else
      render json: '{"status":"failure"}'
    end
  end

  private

  def set_follow_up
    @follow_up = FollowUp.find(params[:id])
  end

  def get_follow_up_as_json(follow_up)
    return follow_up.to_json.chop + ',"work_activity_ids":' +
      follow_up.work_activity_ids.to_s + ',"hazardous_condition_ids":' +
      follow_up.hazardous_condition_ids.to_s + ',"household_task_ids":' +
      follow_up.household_task_ids.to_s + '}'
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def follow_up_params
    params.require(:follow_up).permit(
      :person_id,
      :follow_date, :did_work, :have_job_returning_to, :hours_worked, :occupation_id, :industry_id,
      :exposed_to_hazardous_condition, :subject_to_abuses, :performed_housework,
      :hours_worked_on_housework, :enrolled_in_school,
      :work_activity_ids => [],
      :hazardous_condition_ids => [],
      :household_task_ids => []
    )
  end

end