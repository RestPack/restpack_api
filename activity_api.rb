require './base'

class ActivityApi < Base
  get "/" do
    authorize!
    render Commands::Activities::Activity::List.run(params, application_params(request))
  end

  get "/:id" do
    authorize!
    render Commands::Activities::Activity::Get.run(params, application_params(request))
  end

  post "/" do
    authorize!
    render Commands::Activities::Activity::Create.run(params, application_params(request))
  end

  put "/:id" do
    authorize!
    render Commands::Activities::Activity::Update.run(params, application_params(request))
  end

  delete "/:id" do
    authorize!
    render Commands::Activities::Activity::Destroy.run(params, application_params(request))
  end
end
