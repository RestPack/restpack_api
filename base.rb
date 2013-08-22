class Base < Sinatra::Base
  helpers do
    def authorize!
      return if authorized?
      headers['WWW-Authenticate'] = 'Basic realm="Restricted Area"'
      halt 401, "Not authorized\n"
    end

    def authorized?
      @auth ||=  Rack::Auth::Basic::Request.new(request.env)

      if @auth.provided? and @auth.basic? and @auth.credentials
        #TODO: GJ: check the api_token and domain
        p "HOST: #{request.env['SERVER_NAME']}"
        p "API_TOKEN: #{@auth.credentials[1]}"

        @application_id = 888

        @auth.credentials == ['admin', 'password']
      else
        false
      end
    end
  end

  def application_params(request)
    {
      application_id: @application_id
    }
  end

  def render(response)
    status response.code
    response.result[:errors] = response.errors
    response.result.to_json
  end
end
