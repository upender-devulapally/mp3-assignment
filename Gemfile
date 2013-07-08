source 'https://rubygems.org'
ruby '1.9.3'

gem 'rails', '3.2.11'

gem "heroku"
group :assets do
  gem 'sass-rails', '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  #gem "less-rails", "~> 2.2.6"
  #gem 'therubyracer', '0.11.1', :platform => :ruby
  gem 'uglifier', '>= 1.0.3'
end


gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

gem 'devise'
gem 'figaro'
gem 'haml-rails'
gem 'libv8', '~> 3.11.8'
gem 'mongoid'
gem 'thin'
gem 'carrierwave', :git => "git://github.com/jnicklas/carrierwave.git"
gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'
gem 'mime-types', :require => "mime/types"
gem 'ruby-mp3info', :require => "mp3info"

group :development do
 # gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :rbx]
  gem 'html2haml'
  gem 'hub', :require=>nil
  gem 'quiet_assets'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
end

group :test do
  gem 'capybara'
  gem 'cucumber-rails', :require=>false
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'launchy'
  gem 'mongoid-rspec'
end

