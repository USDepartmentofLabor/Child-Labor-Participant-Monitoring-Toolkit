class Api::V1::ReportsController < Api::Controller
  def update
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

  private

  def tpr_params
    params[:technical_progress_report].permit(
      :reporting_period_id, :annex_a_included, :annex_b_included,
      :annex_c_included, :annex_d_included, :annex_e_included,
      :annex_f_included, :annex_g_included, :annex_h_included,
      :is_final_report, :is_semi_annual, :submitted_by, :date_submitted,
      report_comments_attributes: [:id, :body, :category])
  end
end
