# This file is used by Rack-based servers to start the application.
current_dir = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift current_dir unless $LOAD_PATH.include?(current_dir)

require 'app'
run SceneMaster::App
