source 'https://rubygems.org'

# Peg to rails 4.2.0
gem 'rails', '4.2.0'

# Use postgresql as the database for Active Record
gem 'pg'

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

# User puma as the application server
gem 'puma'

group :development do
  gem 'quiet_assets'
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano3-puma'
  gem 'capistrano-sidekiq'
  # use this only because the server can not access to our internal git repo
  gem 'capistrano-scm-copy'
end

group :development, :test do
  # Load environment variables from .env
  gem 'dotenv-rails'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'faker', require: false

  # testing
  gem 'rspec-rails'
  gem 'rb-fsevent', require: RUBY_PLATFORM =~ /darwin/i ? 'rb-fsevent' : false
  gem 'factory_girl_rails'
  gem 'guard-rspec', require: false
  gem 'spring-commands-rspec'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'fuubar'
  gem 'foreman'
end

gem 'rails-i18n'
gem 'i18n-active_record', :require => 'i18n/active_record'
gem 'devise'
gem 'font-awesome-rails'
gem 'bootstrap-sass'
gem 'adminlte2-rails'
gem 'icheck-rails'

# carrierwave does file uploading
gem 'carrierwave'

# lightweight ImageMagick interface
gem 'mini_magick'

# background processes
gem 'sidekiq'

gem 'country_select', github: 'stefanpenner/country_select'

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
gem 'momentjs-rails'
gem 'aws-ses'
gem 'jquery-ui-rails'
