class Api::V1::IncomeSourcesController < Api::ApiController
  before_action :set_income_source, only: [:show, :update]

  # GET /api/v1/income_sources  
  def index
    render json: IncomeSource.all.to_json
  end

  # GET /api/v1/income_sources/1
  def show
    render json: @income_source.to_json
  end

  # POST /api/v1/income_sources
  def create
    @income_source = IncomeSource.new(income_sources_params)
    if @income_source.save
      render json: '{"status":"success","updated_at":"' +
        get_datetime_formatted(@income_source.updated_at) +
        '","created_at":"' +
        get_datetime_formatted(@income_source.created_at) +
        '","id":"' + @income_source.id.to_s + '"}'
    else
      render json: '{"status":"failure"}'
    end       
  end

  # PUT /api/v1/income_sources/1
  def update   
    if @income_source.update(income_sources_params)
      render json: '{"status":"success", "updated_at":"' +
        get_datetime_formatted(@income_source.updated_at) + '"}'
    else
      render json: '{"status":"failure"}'
    end
  end
  
  private

    def set_income_source
      @income_source = IncomeSource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def income_sources_params
      params.require(:income_source).permit(
        :name, :estimated_volume_produced, :estimated_volume_sold,
        :estimated_income, :household_id, :unit_of_measure, :currency)      
    end

end