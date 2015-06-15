class ReportsController < ApplicationController
  before_action :get_authed_report, only: [:show, :destroy]

	def index
		@reports = Report.where(user_id: current_user.id).all
	end

  def show
    # Generate report on demand
    education_report = EducationIndicator.new(@report.service_ids, @report.start_date, @report.end_date)

    @work_statuses = WorkStatus.where(id: @report.target_ids).order(:id)

    @results = []
    @work_statuses.each do |work_status|
      @results << education_report.generate(work_status.id)
    end
  end

	def new
		@report = Report.new
	end

  def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id
    if @report.save
      redirect_to reports_path, notice: t("action_messages.create", model: "Report")
    else
      render :new
    end
  end

  def destroy
    @report.destroy
    redirect_to reports_url, t("action_messages.destroy", model: "Report")
  end

  private

    # Only allow a trusted parameter "white list" through.
    def report_params
      params.require(:report).permit(:title, :start_date, :end_date, :service_type, :target_type, {service_ids: []}, {target_ids: []})
    end

    def get_authed_report
      @report = Report.find(params[:id])
      if @report.user_id != current_user.id
        raise ActiveRecord::RecordNotFound
      end
      @report
    end
end