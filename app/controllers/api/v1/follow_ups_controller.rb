class Api::V1::FollowUpsController < Api::ApiController
  before_filter :ensure_user_allowed

  # GET /api/follow_ups
  def index
    if FollowUp.count.zero?
      render json: '[]'
    else
      json = '['
      for follow_up in FollowUp.all do
        json << get_follow_up_as_json(follow_up) + ','
      end
      json = json.chop
      json << ']'
      render json: json
    end
  end

  # GET /api/follow_ups/1
  def show
    if FollowUp.exists?(params[:id])
      set_follow_up
      render json: get_follow_up_as_json(@follow_up)
    else
      render status: 404, json: '{"status":"failure"}'
    end
  end

  # POST /api/v1/follow_ups
  def create
    if !validate_request
      render status: 400, json: '{"status":"failure"}'
      return
    end

    @follow_up = FollowUp.new(follow_up_params)
    if @follow_up.save
      render status: 201, json: '{"status":"success","updated_at":"' +
        get_datetime_formatted(@follow_up.updated_at) + '","created_at":"' +
        get_datetime_formatted(@follow_up.created_at) + '","id":"' +
        @follow_up.id.to_s + '"}'
    else
      render status: 500, json: '{"status":"failure"}'
    end
  end

  # PUT /api/follow_ups/1
  def update
    if FollowUp.exists?(params[:id])
      set_follow_up
      if !validate_request
        render status: 400, json: '{"status":"failure"}'
        return
      end
      if @follow_up.update(follow_up_params)
        render json: '{"status":"success", "updated_at":"' +
          get_datetime_formatted(@follow_up.updated_at) + '"}'
      else
        render status: 500, json: '{"status":"failure"}'
      end
    else
      render status: 404, json: '{"status":"failure"}'
    end
  end

  private

  def validate_request
    # check if person_id is valid if not null
    if follow_up_params[:person_id].present?
      if !Person.exists?(follow_up_params[:person_id])
        return false
      end
    end

    # do not allow null person_id
    if follow_up_params[:person_id].blank?
      return false
    end

    # TODO: ids x 3

    return true
  end

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
      :person_id, :follow_date, :did_work, :have_job_returning_to,
      :hours_worked, :occupation_id, :industry_id,
      :exposed_to_hazardous_condition, :subject_to_abuses,
      :performed_housework, :hours_worked_on_housework, :enrolled_in_school,
      :latitude, :longitude, :position_accuracy, :altitude, :altitude_accuracy,
      :heading, :speed, :gps_recorded_at,
      :work_activity_ids => [],
      :hazardous_condition_ids => [],
      :household_task_ids => [])
  end

end
