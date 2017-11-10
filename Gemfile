source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'bootstrap', '~> 4.0.0.alpha6'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'font-awesome-rails'
gem 'foreman'
gem 'jbuilder', '~> 2.5'
gem 'mysql2', '>= 0.3.18', '< 0.5'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.2'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'
gem 'ridgepole'
gem 'unsplash'

gem 'refile', require: 'refile/rails', github: 'manfe/refile'
gem 'refile-mini_magick'
gem 'refile-s3', '~> 0.2.0'

gem 'acts-as-taggable-on', github: 'mbleigh/acts-as-taggable-on', branch: 'master'

gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'semantic-ui-sass', git: 'https://github.com/doabit/semantic-ui-sass.git'

gem 'kaminari'

group :development, :test do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'pry-rails'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
end

group :development do
  gem 'annotate', require: false
  gem 'capybara', '~> 2.13'
  gem 'database_cleaner'
  gem 'ffaker'
  gem 'launchy'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop', require: false
  gem 'selenium-webdriver'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
  gem 'letter_opener'
  gem 'letter_opener_web'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
