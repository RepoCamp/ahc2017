require 'fcrepo_wrapper'
require 'fcrepo_wrapper/rake_task'
require 'solr_wrapper'
require 'active_fedora/cleaner'

namespace :dev do
  desc "Cleans out everything. Everything. Don't try this at home."
  task clean: :environment do
    ActiveFedora::Cleaner.clean!
    cleanout_redis
    clear_directories
    Rake::Task["db:reset"].invoke
    `bundle exec rails hyrax:default_admin_set:create`
    `bundle exec rails hyrax:workflow:load`
  end

  def clear_directories
    FileUtils.rm_rf(Hyrax.config.derivatives_path)
    FileUtils.mkdir_p(Hyrax.config.derivatives_path)
    FileUtils.rm_rf(Hyrax.config.upload_path.call)
    FileUtils.mkdir_p(Hyrax.config.upload_path.call)
  end

  def cleanout_redis
    Redis.current.keys.map { |key| Redis.current.del(key) }
  rescue => e
    Logger.new(STDOUT).warn "WARNING -- Redis might be down: #{e}"
  end
end
