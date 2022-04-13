source 'https://rubygems.org'

ruby '2.7.2'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 7.0'
# Use Puma as the app server
gem 'puma', '~> 3.7'
gem 'bootsnap'

# Asset Compilation Pipeline
gem 'sprockets', '~> 4.0'
gem 'sprockets-rails', :require => 'sprockets/railtie'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Authentication
gem 'devise'
# Translation for Auth
gem 'devise-i18n'

gem 'bootstrap-sass', '~> 3.4.1'
gem 'jquery-rails', '~> 4.1', '>= 4.1.1'
gem 'xmlrpc', '~> 0.3.0'
gem 'gravatar-ultimate', '~> 2.0'
gem 'redcarpet', '~> 3.4'

gem 'pg'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.2'
end

group :development do

  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'foreman'
  gem 'io-console','~> 0.5.9'

end

group :production do
  #gem 'pg', '0.18.4'
end

# Added at 2022-03-30 16:12:36 +0200 by michaelzioerjen:
gem "tailwindcss-rails", "~> 2.0"

# Added at 2022-03-30 21:36:46 +0200 by michaelzioerjen:
gem "importmap-rails", "~> 1.0"
