source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.2'
gem 'mysql2', '>= 0.3.18', '< 0.5'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'foreman'
gem 'devise'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'bootstrap', '~> 4.0.0.alpha6'
gem 'font-awesome-rails'

gem "refile", require: "refile/rails", github: 'manfe/refile'
gem "refile-mini_magick"
gem "refile-s3", '~> 0.2.0'

gem 'acts-as-taggable-on', '~> 4.0'

gem 'semantic-ui-sass', git: 'https://github.com/doabit/semantic-ui-sass.git'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'pry-rails'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem "ffaker"
  gem "database_cleaner"
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem "launchy"
  gem 'annotate', require: false
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
