class IndicatorDetailsController < ApplicationController
  before_action :set_indicator
  before_action :set_indicator_detail, only: [:edit, :update]

  def new
    @indicator_detail = IndicatorDetail.new
    @indicator_detail.reporting_period_id = params[:reporting_period_id]
  end

  def create
    @indicator_detail = IndicatorDetail.new(indicator_detail_params)
    @indicator_detail.indicator = @indicator

    @indicator_detail.save

    redirect_to indicator_path(@indicator), notice: t("action_messages.create",
      model: "IndicatorDetail")
  end

  def edit
  end

  def update
    if @indicator_detail.update(indicator_detail_params)
    redirect_to indicator_path(@indicator), notice: t("action_messages.update",
      model: "IndicatorDetail")
    else
      render :edit
    end
  end

private

  def set_indicator
    @indicator = Indicator.find(params[:indicator_id])
  end

  def set_indicator_detail
    @indicator_detail = IndicatorDetail.find(params[:id])
  end

  def indicator_detail_params
    params.require(:indicator_detail).permit(
      :target, :actual, :reporting_period_id
    )
  end
end
