class ReportsController < ApplicationController
  before_action :set_project
  before_action :set_report, only: [:show, :destroy]

  def index
    @reports = Report.where(project_id: @project.id).all
  end

  def show
    # Generate report on demand
    @indicator = Indicator.where(id: @report.indicator_id, project_id: @project.id).first

    if @indicator.indicator_type == "Common" && @indicator.code == "E1"
      education_report = EducationIndicator.new(EducationStatus.pluck(:id), @report.start_date, @report.end_date, @report.project_id)

      @results = education_report.generate
    end
  end

  def new
    @report = Report.new
    @indicators = Indicator.where(project_id: @project.id).all
  end

  def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id
    @report.project_id = @project.id
    if @report.save
      redirect_to project_reports_path(@project), notice: t("action_messages.create", model: "Report")
    else
      render :new
    end
  end

  def destroy
    @report.destroy
    redirect_to project_reports_url(@project), notice: t("action_messages.destroy", model: "Report")
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

    def set_report
      # @report = Report.find(params[:id])
      # if @report.user_id != current_user.id
      #   raise ActiveRecord::RecordNotFound
      # end
      # @report
      @report = @project.reports.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end
end