# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.2"

gem "bootsnap", require: false
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rack-cors", "~> 1.1.1"
gem "rails", "~> 7.0.3"
gem "tzinfo-data", platforms: %i(mingw mswin x64_mingw jruby)
# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

group :development, :test do
  gem "brakeman", "~> 3.3", ">= 3.3.2", require: false
  gem "bundler-audit", "~> 0.9.0"
  gem "debug", platforms: %i(mri mingw x64_mingw)
  gem "factory_bot_rails", "~> 6.2.0"
  gem "ffaker", "~> 2.19.0"
  gem "figaro", "~> 1.2.0"
  gem "pry-byebug", "~> 3.9"
  gem "pry-rails", "~> 0.3.9"
  gem "rspec-rails", "~> 5.0.2"
  gem "rubocop", "~> 1.21.0", require: false
  gem "rubocop-checkstyle_formatter", "~> 0.5.0", require: false
  gem "rubocop-rails", "~> 2.12.2", require: false
  gem "rubocop-rspec", "~> 2.5.0", require: false
  gem "shoulda-matchers", "~> 5.0.0"
  gem "simplecov", "~> 0.21.2"
  gem "simplecov-json", "~> 0.2.3"
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
  gem "letter_opener_web", "~> 1.4", ">= 1.4.1"
  gem "listen", "~> 3.3"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring", "~> 3.0.0"
  gem "spring-commands-rspec", "~> 1.0.4"
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem "rack-mini-profiler", "~> 2.0"
end

group :test do
  gem "timecop", "~> 0.9.4"
end
