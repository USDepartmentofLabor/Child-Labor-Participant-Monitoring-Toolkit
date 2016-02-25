class ReportsController < ApplicationController
  before_action :set_project
  before_action :set_report, only: [:show, :destroy]

  def index
    @reports = Report.order("id DESC").all
  end

  def show
    # Generate report on demand
    @indicator = Indicator.where(id: @report.indicator_id).first

    if !@indicator.nil? && @indicator.indicator_type == "Common"
      if @indicator.code == "E1"
        education_report = EducationIndicator.new(EducationStatus.pluck(:id), @report.start_date, @report.end_date, @report.project_id)

        @results = education_report.generate

        render "show_e1"

      elsif @indicator.code == "L1"
        render "show_l1"
      end

    else
      render :show
    end
  end

  def new
    @report = Report.new
    @indicators = Indicator.order("id ASC").all
  end

  def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id
    if @report.save
      redirect_to reports_path(), notice: t("action_messages.create", model: "Report")
    else
      render :new
    end
  end

  def destroy
    @report.destroy
    redirect_to reports_url(), notice: t("action_messages.destroy", model: "Report")
  end

  private

    # Only allow a trusted parameter "white list" through.
    def report_params
      params.require(:report).permit(
        :title, :start_date, :end_date,
        :service_type, :target_type, {service_ids: []}, {target_ids: []},
        :indicator_id, :desc
      )
    end

    def set_project
      @project = Project.first
    end

    def set_report
      # @report = Report.find(params[:id])
      # if @report.user_id != current_user.id
      #   raise ActiveRecord::RecordNotFound
      # end
      # @report
      @report = Report.find(params[:id])
    end
end
