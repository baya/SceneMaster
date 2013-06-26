# -*- coding: utf-8 -*-

# libdir = '/Users/jiangguimin/Projects/ground/lib'
libdir = '/Users/jim/Projects/ground/lib'
$LOAD_PATH.unshift libdir unless $LOAD_PATH.include?(libdir)

current_dir = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift current_dir unless $LOAD_PATH.include?(current_dir)

activity_dir = File.expand_path(File.join(File.dirname(__FILE__), 'activities'))
$LOAD_PATH.unshift activity_dir unless $LOAD_PATH.include?(activity_dir)

require 'bundler/setup'
require 'ground'
require 'rack'
require 'haml'
require 'tilt'
require 'sequel'
require 'json'
require 'logger'
require 'bcrypt'

require 'protocol/crud'
require 'protocol/find'
require 'protocol/delete'
require 'protocol/update'
require 'protocol/sort'
require 'protocol/current'
require 'scene/index'
require 'scene/new'
require 'scene/create'
require 'scene/show'
require 'scene/edit'
require 'activity/create'
require 'activity/delete'
require 'activity/update'
require 'session/sign_form'
require 'session/sign_up'
require 'session/login_form'
require 'session/login'
require 'session/logout'
require 'sort_array/save'
require 'create_scene'
require 'create_activity'
require 'update_activity'
require 'create_sort_array'
require 'create_user'
require 'validate_scene'
require 'validate_activity'
require 'validate_user'
require 'authenticate_user'
require 'sort_activities'
require 'route'

module SceneMaster
  # sequel -m migrations/ postgres://pgsql:@localhost/SceneMaster_development
  # DB = Sequel.connect('postgres://pgsql:@localhost/SceneMaster_development')
  # migration command, bin/sequel -E -m migrations/ sqlite://./SceneMaster_development.db
  DB = Sequel.sqlite('SceneMaster_development.db')
  DB.loggers << ::Logger.new('logs/development.log')
  
  root = File.dirname(__FILE__)
  config = Ground::Config(views: File.expand_path(File.join(root, 'views')))

  App = Ground::CreateApp(name: '场景大师', config: config)

  Ground::StartApp app: App, port: 9393 do
    use Rack::ShowExceptions
    use Rack::CommonLogger
    use Rack::Static, :urls => ['/assets']
    use Rack::Session::Pool
  end
  
end
