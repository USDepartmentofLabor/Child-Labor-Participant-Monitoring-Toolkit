class SubmitTprWorker
  include Sidekiq::Worker

  def perform(id)

    puts "Submitting TPR #{id}"

    tpr = TechnicalProgressReport.find(id)

    # Only drafts and revisions can be submitted
    if tpr.reporting_status_id != 1 && tpr.reporting_status_id != 3
      return
    end

    SwaggerClient.configure do |c|
      c.api_key['Authorization'] = Project.first.api_key
      c.scheme = 'http'
      c.host = '192.168.70.140:3000'
    end

    client = SwaggerClient::DefaultApi.new

    begin
      client.upload_tpr(tpr)
    rescue SwaggerClient::ApiError => e
      puts "Exception when calling API->submit_tpr: #{e}"
    end

  end
end
