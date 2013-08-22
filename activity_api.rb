require './base'

class ActivityApi < Base
  get "/.json" do
    authorize!
    render Commands::Activity::List.run(params, application_params(request))
  end

  get "/:id.json" do
    authorize!
    render Commands::Activity::Get.run(params, application_params(request))
  end

  post "/.json" do
    authorize!
    render Commands::Activity::Create.run(params, application_params(request))
  end

  put "/:id.json" do
    authorize!
    render Commands::Activity::Update.run(params, application_params(request))
  end

  delete "/:id.json" do
    authorize!
    render Commands::Activity::Destroy.run(params, application_params(request))
  end
end
