class TargetsController < ApplicationController
  before_action :set_indicator

  def index
    @targets = Target.where(indicator_id: params[:indicator_id]).all
  end

  def new
    @target = Target.new
  end

  private

  def set_indicator
    @indicator = Indicator.find(params[:indicator_id])
  end
end
