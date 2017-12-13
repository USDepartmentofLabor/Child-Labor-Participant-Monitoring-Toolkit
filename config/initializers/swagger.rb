SwaggerClient.configure do |c|
  c.api_key['Authorization'] = Project.first.api_key
  c.scheme = ENV['API_SCHEME'] || 'http'
  c.host = ENV['API_HOST']
  c.base_path = '/api'
end
