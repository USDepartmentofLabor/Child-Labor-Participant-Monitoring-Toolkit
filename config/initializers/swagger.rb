SwaggerClient.configure do |c|
  c.api_key['Authorization'] = 'Token token="f4c6ee360846549f07e5155ebfaec5db"' #Project.first.api_key
  c.scheme = ENV['API_SCHEME'] || 'http'
  c.host = ENV['API_HOST']
  c.base_path = '/api'
end
