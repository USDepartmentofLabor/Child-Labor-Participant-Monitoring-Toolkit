class ReportAttachmentsController < ApplicationController
  def create
    @report_attachment = ReportAttachment.new(attachment_params)
    @report_attachment.technical_progress_report_id =
      params[:technical_progress_report_id]

    @report_attachment.attachment_version = 1
    @report_attachment.save

    redirect_to technical_progress_report_path(params[:technical_progress_report_id])
  end

  private

  def attachment_params
    params.require(:report_attachment).permit([:attachment, :attachment_annex])
  end
end
