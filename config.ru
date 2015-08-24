require './app'
require 'rubygems'
require 'bundler'
Bundler.require
logger = Logger.new('log/app.log')
use Rack::CommonLogger, logger
use Rack::Session::Cookie , :secret => 'change_me'
use Rack::CommonLogger
use Rack::ShowExceptions
use Rack::Static,
  :urls => ["/media/fonts", "/media/js", "/media/css", "media/images"],
  :root => "public"

run App::Dispatcher
