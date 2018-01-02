class SubmitTprWorker
  include Sidekiq::Worker

  def perform(id)

    puts "Submitting TPR #{id}"

    input = Report.find(id)
    output = SwaggerClient::Report.new

    output.id = input.id
    output.reporting_period = {
      start_date: input.reporting_period.start_date,
      end_date: input.reporting_period.end_date,
      period_type: 'standard'
    }
    output.submitted_by = {
      # TODO
      name: 'Submitter',
      email: 'submitter@example.com'
    }
    output.submitted_on = Time.now
    #output.is_final_report = input.is_final_report
    output.attachments = []
    input.report_attachments.each do |att|
      output.attachments.push(SwaggerClient::Attachment.new(
        annex: att.attachment_annex,
        version: att.attachment_version,
        body: Base64.encode64(File.read(att.attachment.path)),
        file_name: att.attachment_file_name,
        mime_type: att.attachment_content_type
      ))
    end
    output.comments = []
    input.comments.each do |c|
      output.comments.push(SwaggerClient::Comment.new(
        author: c.author,
        body: c.body,
        submitted_on: c.submitted_at
      ))
    end

    # Only queued TPRs can be submitted
    if input.report_status_id != 6
      return
    end

    client = SwaggerClient::ReportApi.new

    begin
      client.add_report output
#      tpr.report_status_id = 2
#      tpr.save
    rescue SwaggerClient::ApiError => e
      puts "Exception when calling API->submit_tpr: #{e}"
    end

  end
end
