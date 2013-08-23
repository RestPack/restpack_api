require 'restpack_activity_service'
require 'restpack_core_service'
RestPack::Core::Service::Tasks.load_tasks
RestPack::Activity::Service::Tasks.load_tasks

desc "Starts restpack_api on port 8001"
task :start do
  exec "foreman start -p 8001"
end
