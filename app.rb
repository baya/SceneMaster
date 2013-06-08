# -*- coding: utf-8 -*-

libdir = '/Users/jiangguimin/Projects/ground/lib'
$LOAD_PATH.unshift libdir unless $LOAD_PATH.include?(libdir)

current_dir = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift current_dir unless $LOAD_PATH.include?(current_dir)

activity_dir = File.expand_path(File.join(File.dirname(__FILE__), 'activities'))
$LOAD_PATH.unshift activity_dir unless $LOAD_PATH.include?(activity_dir)


require 'ground'
require 'rack'
require 'haml'
require 'tilt'
require 'sequel'
require 'json'
require 'protocol/find'
require 'scene/index'
require 'scene/new'
require 'scene/create'
require 'scene/show'
require 'activity/create'
require 'create_scene'
require 'create_activity'
require 'validate_scene'
require 'validate_activity'

module SceneMaster
  DB = Sequel.connect('postgres://pgsql:@localhost/SceneMaster_development')
  root = File.dirname(__FILE__)
  config = Ground::Config(views: File.expand_path(File.join(root, 'views')))

  App = Ground::CreateApp(name: '场景大师', config: config)

  Ground::StartApp app: App, port: 9393 do
    use Rack::ShowExceptions
    use Rack::CommonLogger
    use Rack::Static, :urls => ['/assets']
  end
  
end
