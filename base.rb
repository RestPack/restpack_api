class Base < Sinatra::Base
  helpers do
    def authorize!
      return if authorized?
      headers['WWW-Authenticate'] = 'Basic realm="Restricted Area"'
      halt 401, '{ "error": "Not authorized" }'
    end

    def authorized?
      @auth ||=  Rack::Auth::Basic::Request.new(request.env)

      if @auth.provided? and @auth.basic? and @auth.credentials
        application_id = @auth.credentials[0]
        api_token = @auth.credentials[1]

        response = RestPack::Core::Service::Commands::Application::VerifyApiToken.run({
          id: application_id,
          api_token: api_token
        })

        if response.success?
          @application_id = response.result[:id]
        else
          return false
        end
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
