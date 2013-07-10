# set path to app that will be used to configure unicorn,
# note the trailing slash in this example
app_dir = File.expand_path('../', File.dirname(__FILE__))
worker_processes 2
working_directory app_dir
preload_app true
timeout 30

# Specify path to socket unicorn listens to,
# we will use this in our nginx.conf later
listen "#{app_dir}/tmp/sockets/unicorn.sock", :backlog => 64
# Set process id path
pid "#{app_dir}/tmp/pids/unicorn.pid"

# Set log file paths
stderr_path "#{app_dir}/logs/unicorn.stderr.log"
stdout_path "#{app_dir}/logs/unicorn.stdout.log" 
