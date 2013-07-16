current_dir = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift current_dir unless $LOAD_PATH.include?(current_dir)

require 'app'

Sequel.extension :migration, :core_extensions

# rake db:migrate RACK_ENV=test
namespace :db do
  task :migrate do
    Sequel::Migrator.run Ground.db, 'db/migrations'
  end
end
