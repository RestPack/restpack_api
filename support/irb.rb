p 'Initialising irb session'

require 'restpack_activity_service'
require 'restpack_core_service'

config = YAML.load(IO.read('config/database.yml'))
environment = ENV['RAILS_ENV'] || ENV['DB'] || 'development'
ActiveRecord::Base.establish_connection config[environment]
