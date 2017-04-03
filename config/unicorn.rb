application = 'tothetop2017'
listen "/tmp/unicorn_#{application}.sock"
pid "/tmp/unicorn_#{application}.pid"
worker_processes 4;  # Please check this on **production environment** and ***MASTER BRANCH*
timeout 3600           # Please check this on **production environment** and ***MASTER BRANCH*
preload_app true

shared_path = "/srv/#{application}/shared"
stderr_path "#{shared_path}/log/unicorn.stderr.log"
stdout_path "#{shared_path}/log/unicorn.stdout.log"

before_fork do |server, worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
  end

  old_pid = "/tmp/unicorn_#{application}.pid.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
  end
end
#root = '/srv/tothetop2017/'
#working_directory root
#pid '/srv/tothetop2017/tmp/pids/unicorn.pid'
#stderr_path "#{root}/log/unicorn.log"
#stdout_path "#{root}/log/unicorn.log"

#worker_processes 4
#timeout 180

#environment = ENV['RACK_ENV'] || ENV['RAILS_ENV'] || 'production'

# Save on RAM while in development
#if environment == 'development'
#  worker_processes 2
  #listen '138.68.173.76:3000'
#elsif environment == 'production'
#  listen '138.68.173.76:3000'
#  worker_processes 2
#end

#timeout 60
#preload_app true
#@delayed_job_pid = nil
#before_fork do |server, worker|
  # Close all open connections
 # if defined?(ActiveRecord::Base)
  #  ActiveRecord::Base.connection.disconnect!
#  end
  #@delayed_job_pid ||= spawn('scripts/delayed_job stop ; scripts/delayed_job start')
#end

#after_fork do |server, worker|
  # Reopen all connections
#  if defined?(ActiveRecord::Base)
#    ActiveRecord::Base.establish_connection
#  end
#end
