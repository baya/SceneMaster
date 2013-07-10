# -*- coding: utf-8 -*-

current_dir = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift current_dir unless $LOAD_PATH.include?(current_dir)

activity_dir = File.expand_path(File.join(File.dirname(__FILE__), 'activities'))
$LOAD_PATH.unshift activity_dir unless $LOAD_PATH.include?(activity_dir)

require 'bundler/setup'
require 'ground'
require 'logger'

Bundler.require(:default)

def load_rbfiles(dir)
  files = File.join(dir, '**', '*.rb')
  Dir.glob(files).each {|file| require file}
end

load_rbfiles('protocol')
load_rbfiles('activities')
require 'route'
require 'help'

module SceneMaster
  root = File.dirname(__FILE__)
  # 部署到nitrous时,如果使用daemon的形式启动应用，需要数据库的绝对路径，
  # 否则会出现SQLite3::CantOpenException的错误
  db_path = File.expand_path(File.join(root, 'SceneMaster_development.db'))
  # sequel -m migrations/ postgres://pgsql:@localhost/SceneMaster_development
  # DB = Sequel.connect('postgres://pgsql:@localhost/SceneMaster_development')
  # migration command, bin/sequel -E -m migrations/ sqlite://./SceneMaster_development.db
  DB = Sequel.sqlite(db_path)
  DB.loggers << ::Logger.new('logs/development.log')
  
  
  config = Ground::Config(views: File.expand_path(File.join(root, 'views')))

  App = Ground::CreateApp(name: '场景', config: config) do
    use Rack::ShowExceptions
    use Rack::CommonLogger
    use Rack::Static, :urls => ['/assets']
    use Rack::Session::Pool
  end

end

