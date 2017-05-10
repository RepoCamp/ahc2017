require 'resque/tasks'

task "resque:setup" => :environment do
  ENV['QUEUE'] = '*'

  Resque.after_fork do
    ActiveRecord::Base.establish_connection
  end
end

# task "resque:pool:setup" do
#   Resque::Pool.after_prefork do |job|
#     Resque.redis.client.reconnect
#   end
# end
