app_name = 'gruzovik'
root = "/var/www/html/#{app_name}"

working_directory root

pid "#{root}/tmp/pids/unicorn.pid"

stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

worker_processes 4
timeout 30
preload_app true

listen "#{root}/tmp/unicorn.#{app_name}.sock", backlog: 64
#listen 3000
