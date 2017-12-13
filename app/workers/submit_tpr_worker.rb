class SubmitTprWorker
  include Sidekiq::Worker

  def perform(id)

    puts "Submitting TPR #{id}"

    tpr = TechnicalProgressReport.find(id)

    output = SwaggerClient::TprUpload.new

    output.id = tpr.id
    output.reporting_period_end = tpr.reporting_period.end_date
    output.submitter = {
      name: tpr.submitted_by
    }
    output.submitted_on = tpr.date_submitted
    output.is_final_report = tpr.is_final_report
    output.is_semi_annual = tpr.is_semi_annual

#    output.attachments = []
    output.annexes_included = []

    ('a'..'h').each do |a|
      if tpr["annex_#{a}_included"]
        output.annexes_included.push a
      end
    end

#    tpr.report_attachments.each do |att|
#      annex = att.attachment_annex
#      version = att.attachment_version
#      body = Base64.encode64(File.read(att.attachment.path))
#
#      output.attachments.push(
#        {
#          annex: annex,
#          body: body,
#          revision: version
#        }
#      )
#    end

    # Only queued TPRs can be submitted
    if tpr.reporting_status_id != 6
      return
    end

    client = SwaggerClient::DefaultApi.new

    begin
      client.upload_tpr(tpr)
      tpr.reporting_status_id = 2
      tpr.save
    rescue SwaggerClient::ApiError => e
      puts "Exception when calling API->submit_tpr: #{e}"
    end

  end
end
