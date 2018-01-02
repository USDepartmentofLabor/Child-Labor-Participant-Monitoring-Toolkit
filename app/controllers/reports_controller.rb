class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :submit]
  before_action :set_project

  def index
    @reports = Report.all
  end

  def show
    @report_attachment = ReportAttachment.new

    respond_to do |format|
      format.html
      format.pdf do
        end_date = @report.reporting_period.end_date
        pdf = @report.to_pdf
        send_data pdf,
          filename: "TPR_#{end_date.strftime("%Y-%m-%d")}.pdf",
          type: "application/pdf"
      end
    end
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(tpr_params)
    @report.report_status_id = 1
    @report.annexes_required.select! {|a| a != '0'}
    if @report.save
      redirect_to report_path(@report),
        notice: t("action_messages.create",
                  model: Report.model_name.human)
    else
      render :new
    end
  end

  def submit
    @report.assign_attributes(tpr_params)
    @report.comments.select {|x| x.id.nil?}.each do |c|
      c.set_author current_user
    end
    @report.report_status_id = 6
    @report.save
    SubmitTprWorker.perform_async(params[:id])
    redirect_to report_path(@report)
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def set_project
    @project = Project.first
  end

  def tpr_params
    params[:report].permit(
      :reporting_period_id, :is_final_report, :is_semi_annual,
      annexes_required: [],
      comments_attributes: [:id, :body])
  end
end
