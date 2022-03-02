desc "Runs development server with Docker compose"

task :serve do
  sh "./bin/entrypoint.dev.sh"
end
