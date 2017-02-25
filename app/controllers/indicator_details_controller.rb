class IndicatorDetailsController < ApplicationController
  before_action :set_indicator

  def new
    @indicator_detail = IndicatorDetail.new
  end

  def create
    @indicator_detail = IndicatorDetail.new(indicator_detail_params)

    @indicator_detail.save
  end

private

  def set_indicator
    @indicator = Indicator.find(params[:indicator_id])
  end

  def indicator_detail_params
    params.require(:indicator_detail).permit(
      :target, :actual
    )
  end
end
