class IndicatorsController < ApplicationController
  before_action :set_project
  before_action :set_indicator, only: [:show, :edit, :update, :destroy]

  # GET /indicators
  def index
    @indicators = Indicator.where(project_id: @project.id).all
  end

  # GET /indicators/1
  def show
  end

  # GET /indicators/new
  def new
    @indicator = Indicator.new
  end

  # GET /indicators/1/edit
  def edit
  end

  # POST /indicators
  def create
    @indicator = Indicator.new(indicator_params)
    @indicator.user_id = current_user.id
    @indicator.project_id = @project.id

    if @indicator.save
      redirect_to project_indicators_path(@project,@indicator), notice: t("action_messages.create", model: "Indicator")
    else
      render :new
    end
  end

  # PATCH/PUT /indicators/1
  def update
    if @indicator.update(indicator_params)
      redirect_to project_indicators_path(@project,@indicator), notice: t("action_messages.update", model: "Indicator")
    else
      render :edit
    end
  end

  # DELETE /indicators/1
  def destroy
    @indicator.destroy
    redirect_to project_indicators_url, notice: t("action_messages.destroy", model: "Indicator")
  end

  private

    def set_project
      @project = Project.find(params[:project_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_indicator
      @indicator = @project.indicators.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def indicator_params
      params.require(:indicator).permit(:code, :indicator, :indicator_type, :use, :definitions, :frequency)
    end
end
