source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development do
  gem 'quiet_assets'
  gem 'capistrano',  '~> 3.2.1'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-bundler', '~> 1.1.1'
  gem 'capistrano3-puma'
  gem 'capistrano-sidekiq', '~> 0.3.8'
  gem "capistrano-scm-copy" # use this only because the server can not access to our internal git repo
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # testing
  gem 'rspec-rails', '~> 3.0'
  gem 'rb-fsevent', require: RUBY_PLATFORM =~ /darwin/i ? 'rb-fsevent' : false
  gem 'factory_girl_rails'
  gem "guard-rspec", require: false
  gem 'spring-commands-rspec'
  gem "capybara"
  gem 'database_cleaner'
  gem 'launchy'
  # gem 'rb-inotify', '~> 0.9', require: RUBY_PLATFORM =~ /linux/i ? 'rb-inotify' : false
  gem "fuubar"
end

gem 'rails-i18n', '~> 4.0.0'

gem 'devise'

gem "font-awesome-rails"

gem 'bootstrap-generators', '~> 3.3.4'

# carrierwave does file uploading
gem 'carrierwave'

# lightweight ImageMagick interface
gem 'mini_magick'

# background processes
gem 'sidekiq'

gem 'sinatra', :require => nil

# web server
gem 'puma'

gem 'country_select', github: 'stefanpenner/country_select'

# pagination
gem 'kaminari'

# object searching
gem 'ransack'

gem 'faker', require: false

# for heroku deployment
gem 'rails_12factor', group: :production

# Role Based Authorization
gem 'pundit'
