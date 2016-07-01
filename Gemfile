source 'https://rubygems.org'

# Padrino supports Ruby version 1.9 and later
# ruby '2.3.1'

# Distribute your app as a gem
# gemspec

# Server requirements
# gem 'thin' # or mongrel
# gem 'trinidad', :platform => 'jruby'

# Optional JSON codec (faster performance)
# gem 'oj'

# Project requirements
gem 'rake'

# Component requirements
gem 'sass'
gem 'haml'
gem 'activerecord', '>= 3.1', :require => 'active_record'
gem 'pg'
gem "carrierwave", "0.10.0", :require => ["carrierwave", "carrierwave/orm/activerecord"]
gem "mini_magick"
gem "twitter"
gem "figaro"

# Test requirements
gem 'database_cleaner', :group => 'test'
gem 'mocha', :group => 'test', :require => false
gem 'minitest', :require => ['minitest/autorun', 'minitest/pride'], :group => 'test'
gem 'rack-test', :require => 'rack/test', :group => 'test'
gem "simplecov", group: "test"

# Padrino Stable Gem
gem 'padrino', '0.13.2'
# Or Padrino Edge
# gem 'padrino', :github => 'padrino/padrino-framework'

# Or Individual Gems
# %w(core support gen helpers cache mailer admin).each do |g|
#   gem 'padrino-' + g, '0.13.2'
# end
