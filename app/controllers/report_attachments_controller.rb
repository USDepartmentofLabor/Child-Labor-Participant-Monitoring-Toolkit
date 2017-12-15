class ReportAttachmentsController < ApplicationController
  def create
    @report_attachment = ReportAttachment.new(attachment_params)
    @report_attachment.report_id =
      params[:report_id]

    @report_attachment.attachment_version = 1
    @report_attachment.save

    redirect_to report_path(params[:report_id])
  end

  private

  def attachment_params
    params.require(:report_attachment).permit([:attachment, :attachment_annex])
  end
end
