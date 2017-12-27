source 'https://rubygems.org'

gem 'rails', '4.2.10'

# Use postgresql as the database for Active Record
# Locked to 0.20 to avoid deprecation
gem 'pg', '0.20'

# Use SCSS for stylesheets
gem 'sass-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', group: :doc

gem 'puma'

group :production do
  gem 'rails_12factor'
end

group :development do
  gem 'quiet_assets'
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano3-puma'
  gem 'capistrano-sidekiq'
  # use this only because the server can not access to our internal git repo
  gem 'capistrano-scm-copy'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # User puma as the application server
end

group :development, :test do
  # Load environment variables from .env
  gem 'dotenv-rails'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Lock to 1.6.6 to avoid NoMethodError at startup
  gem 'faker', '1.6.6', require: false

  # testing
  gem 'rspec-rails'
  gem 'rb-fsevent', require: RUBY_PLATFORM =~ /darwin/i ? 'rb-fsevent' : false
  gem 'factory_bot_rails'
  gem 'guard-rspec', require: false
  gem 'spring-commands-rspec'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'fuubar'
  gem 'foreman'
  gem 'simplecov', require: false
end

gem 'rails-i18n', '~> 4.0.0'
gem 'i18n-active_record', :require => 'i18n/active_record'
gem 'devise'
gem 'font-awesome-rails'
gem 'bootstrap-sass'
gem 'adminlte2-rails'
gem 'icheck-rails'
gem 'toastr_rails'

# carrierwave does file uploading
gem 'carrierwave'

# lightweight ImageMagick interface
gem 'mini_magick'

# background processes
gem 'sidekiq'

# pagination
gem 'kaminari'

# object searching
gem 'ransack'

# Role Based Authorization
gem 'pundit'

# Format descriptions with markdown
gem 'redcarpet'

gem 'jquery-datatables-rails'
gem 'ckeditor'
gem 'paperclip'
gem 'bootstrap-editable-rails'
gem 'aws-ses'
gem 'httpclient'

# Chart.js for the dashboard
gem 'chartjs-ror'

# Excel export
gem 'axlsx', '= 2.0.1'
gem 'axlsx_rails'

# Our Swagger Generated API Client
gem 'swagger_client', :git => 'https://gitlab.com/tmm/dbms-api-client.git', :tag => '1.2.0'

# Prawn for PDF generation
gem 'prawn'
