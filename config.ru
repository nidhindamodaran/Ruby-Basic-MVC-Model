require 'rack'
require 'rack/server'
require './app/router.rb'

use Rack::CommonLogger
use Rack::ShowExceptions
use Rack::Static,
  :urls => ["/media/fonts", "/media/js", "/media/css"],
  :root => "public"

class Dispatcher

  def self.call(env)
    @request = Rack::Request.new env
    @req_path = @request.path_info
    @req_method = @request.request_method
    @req_params = @request.params
    controller_obj, action = Router.call(@req_path, @req_method, @req_params)
    response = Rack::Response.new
    @res = controller_obj.send(action)
    response.write @res
    response.finish
  end
end
run Dispatcher
