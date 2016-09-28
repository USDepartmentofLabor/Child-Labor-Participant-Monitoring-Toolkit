class TargetsController < ApplicationController
  before_action :set_indicator

  def index
    @targets = Target.where(indicator_id: params[:indicator_id]).all
  end

  def new
    @targets = Array.new

    ReportingPeriod.all.each do |reporting_period|
      new_target = Target.new do |t|
        t.reporting_period = reporting_period
        t.indicator = @indicator
      end

      @targets.push new_target
    end
    #@targets = [Target.new, Target.new, Target.new, Target.new, Target.new, Target.new, Target.new, Target.new, Target.new]
  end

  def edit_mulitple
  end

  def create_multiple

    target_values = params[:targets]

    logger.debug "target_values = #{target_values}"

    target_values.each do |target_value|
      logger.debug "target_value = #{target_value}"
      logger.debug "target_value.target_value = #{target_value[".target_value"]}"
      logger.debug "target_value.reporting_period_id = #{target_value[".reporting_period_id"]}"
      @indicator.targets.create(reporting_period_id: target_value[".reporting_period_id"].to_i, target_value: target_value[".target_value"].delete(",").to_i)
    end

    redirect_to indicators_path(@indicator), notice: t("action_messages.create_multiple", model: "Targets")

  end

  def update_multiple
    @target_values = params[:targets]

    @target_values.each_with_index do |target_value, index|
      target = Target.find_by(period: index, indicator_id: @indicator.id)
      if target
        target.target_value = target_value
        target.save
      end
    end

    redirect_to indicators_path(@indicator), notice: t("action_messages.update_multiple", model: "Targets")

  end

  private

  def set_indicator
    @indicator = Indicator.find(params[:indicator_id])
  end
end
