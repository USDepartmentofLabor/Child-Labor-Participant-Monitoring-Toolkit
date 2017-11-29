class TechnicalProgressReportsController < ApplicationController
  before_action :set_technical_progress_report, only: [:show, :submit]
  before_action :set_project

  def index
    @technical_progress_reports = TechnicalProgressReport.all
  end

  def show
    @report_attachment = ReportAttachment.new

    if @technical_progress_report.report_comments.count == 0
      @technical_progress_report.report_comments.build
    end

    respond_to do |format|
      format.html
      format.pdf do
        end_date = @technical_progress_report.reporting_period.end_date
        pdf = @technical_progress_report.to_pdf
        send_data pdf,
          filename: "TPR_#{end_date.strftime("%Y-%m-%d")}.pdf",
          type: "application/pdf"
      end
    end
  end

  def new
    @technical_progress_report = TechnicalProgressReport.new
  end

  def create
    @technical_progress_report = TechnicalProgressReport.new(tpr_params)
    @technical_progress_report.reporting_status_id = 1
    if @technical_progress_report.save
      redirect_to technical_progress_report_path(@technical_progress_report),
        notice: t("action_messages.create",
                  model: TechnicalProgressReport.model_name.human)
    else
      render :new
    end
  end

  def submit
    @technical_progress_report.update_attributes(tpr_params)
    @technical_progress_report.reporting_status_id = 6
    @technical_progress_report.save
    SubmitTprWorker.perform_async(params[:id])
    redirect_to technical_progress_report_path(@technical_progress_report)
  end

  private

  def set_technical_progress_report
    @technical_progress_report = TechnicalProgressReport.find(params[:id])
  end

  def set_project
    @project = Project.first
  end

  def tpr_params
    params[:technical_progress_report].permit(
      :reporting_period_id, :annex_a_included, :annex_b_included,
      :annex_c_included, :annex_d_included, :annex_e_included,
      :annex_f_included, :annex_g_included, :annex_h_included,
      :is_final_report, :is_semi_annual, :submitted_by, :date_submitted,
      report_comments_attributes: [:id, :body, :category])
  end
end
