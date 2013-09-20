require 'restpack_core_service'
require 'restpack_user_service'
require 'restpack_activity_service'
require 'restpack_group_service'
require 'restpack_account_service'

require './activity_api'

config = YAML.load(IO.read('config/database.yml'))
environment = ENV['RAILS_ENV'] || ENV['DB'] || 'development'
ActiveRecord::Base.establish_connection config[environment]

#TODO: this currently doesn't map /api/v1/activities.json (https://github.com/rack/rack/pull/554)

map '/api/v1/activities' do
  run ActivityApi
end
