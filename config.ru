require 'rack'
require 'rack/server'
require './app/router.rb'
require './config/includes.rb'

use Rack::CommonLogger
use Rack::Session::Cookie , :secret => 'change_me'
use Rack::CommonLogger
use Rack::ShowExceptions
use Rack::Static,
  :urls => ["/media/fonts", "/media/js", "/media/css", "media/images"],
  :root => "public"

class Dispatcher
  def self.call(env)
    request = Rack::Request.new env
    puts ENV["VERSION"].to_i
    req_path = request.path_info
    req_method = request.request_method
    req_params = request.params
    request.session[:user_id]
    puts session = request.session
    controller_obj, action = Router.call(req_path, req_method, req_params, session)
    response = Rack::Response.new
    res = controller_obj.send(action)
    #puts "session #{controller_obj.instance_variable_get(:@session[:user_id])}"
    request.session.update(controller_obj.instance_variable_get(:@session))
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"

    if controller_obj.instance_variable_get(:@status) == 301
      response.redirect res
      response.finish
    else
      response.write res
      response.finish
    end
    
  end
end
run Dispatcher
