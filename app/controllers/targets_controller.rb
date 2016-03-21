class TargetsController < ApplicationController
  before_action :set_indicator

  def index
    @targets = Target.where(indicator_id: params[:indicator_id]).all
  end

  def new
    @targets = [Target.new, Target.new, Target.new, Target.new, Target.new, Target.new, Target.new, Target.new, Target.new, Target.new]
  end

  def create_multiple

    @target_values = params[:targets]

    @target_values.each_with_index do |target_value, index|
      Target.create(period: index, target_value: target_value, indicator_id: @indicator.id)
    end

    redirect_to indicators_path(@indicator), notice: t("action_messages.create_multiple", model: "Targets")

  end

  private

  def set_indicator
    @indicator = Indicator.find(params[:indicator_id])
  end
end
