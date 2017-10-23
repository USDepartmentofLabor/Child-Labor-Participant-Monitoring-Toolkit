class SubmitTprWorker
  include Sidekiq::Worker

  def perform(id)

    puts "Submitting TPR #{id}"

    tpr = TechnicalProgressReport.find(id)

    # Only queued TPRs can be submitted
    if tpr.reporting_status_id != 6
      return
    end

    SwaggerClient.configure do |c|
      c.api_key['Authorization'] = Project.first.api_key
      c.scheme = 'http'
      c.host = '192.168.70.140:3001'
      c.base_path = '/api'
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
