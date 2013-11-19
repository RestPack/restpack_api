require 'restpack_core_service'
require 'restpack_activity_service'

require './activity_api'

config = YAML.load(IO.read('config/database.yml'))
environment = ENV['RAILS_ENV'] || ENV['DB'] || 'development'
ActiveRecord::Base.establish_connection config[environment]

map '/api/v1/activities' do
  run ActivityApi
end
