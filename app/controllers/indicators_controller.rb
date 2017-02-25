class IndicatorsController < ApplicationController
  before_action :set_indicator, only: [:show, :edit, :update, :destroy]

  # GET /indicators
  def index
    respond_to do |format|
      format.html
      format.json { render json: IndicatorsDatatable.new(view_context) }
    end
  end

  # GET /indicators/new
  def new
    @indicator = Indicator.new
  end

  # POST /indicators
  def create
    @indicator = Indicator.new(indicator_params)
    @indicator.user_id = current_user.id
    @indicator.indicator_type = "Custom"

    if @indicator.save
      redirect_to indicators_path,
        notice: t("action_messages.create", model: "Indicator")
    else
      render :new
    end
  end

  # PATCH/PUT /indicators/1
  def update
    if @indicator.update(indicator_params)
      redirect_to indicator_path(@indicator),
        notice: t("action_messages.update", model: "Indicator")
    else
      render :edit
    end
  end

  # DELETE /indicators/1
  def destroy
    @indicator.destroy
    redirect_to indicators_url,
      notice: t("action_messages.destroy", model: "Indicator")
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_indicator
    @indicator = Indicator.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def indicator_params
    params.require(:indicator).permit(
      :code, :indicator, :use, :definitions, :frequency_definitions,
      :unit_of_measure_id, :baseline, :reporting_frequency_id
    )
  end
end
