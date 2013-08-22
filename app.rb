require 'sinatra/base'

class App < Sinatra::Base
  enable :sessions

  get '/' do
    'Welcome to the API'
  end
end
