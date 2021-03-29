source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
ruby '3.0.0'
gem 'rails', '~> 6.1.3', '>= 6.1.3.1'

gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0' 
gem 'bootsnap', '>= 1.4.4', require: false
group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end
gem 'rexml'
group :production do
  gem "pg"
end
group :development do
  gem 'sqlite3', '~> 1.4'
  gem 'rspec-rails', '~> 5.0.0'
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
end
group :test do
  gem 'shoulda-matchers', '~> 4.0'

  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
