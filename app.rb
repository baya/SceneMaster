# -*- coding: utf-8 -*-
lib_dir = '/Users/jim/Projects/ground/lib'
$LOAD_PATH.unshift lib_dir unless $LOAD_PATH.include?(lib_dir)

current_dir = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift current_dir unless $LOAD_PATH.include?(current_dir)

activity_dir = File.expand_path(File.join(File.dirname(__FILE__), 'activities'))
$LOAD_PATH.unshift activity_dir unless $LOAD_PATH.include?(activity_dir)

require 'bundler/setup'
require 'ground'
require 'logger'
require 'yaml'

Bundler.require(:default)

def load_rbfiles(dir)
  files = File.join(dir, '**', '*.rb')
  Dir.glob(files).each {|file| require file}
end

load_rbfiles('protocol')
load_rbfiles('activities')
require 'config/routes'
require 'config/helpers'
require 'config/sets'

module SceneMaster

  DB = Ground.db
  DB.loggers << Ground.logger

  App = Ground '场景' do
    use Rack::ShowExceptions
    use Rack::CommonLogger
    use Rack::Static, :urls => ['/assets']
    use Rack::Session::Cookie, {
      secret: 'abc123'
    }
  end

end

