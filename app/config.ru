require 'rack'
require 'rack/server'
require './router.rb'
require './controller/person_controller.rb'
require './controller/session_controller.rb'

use Rack::Static,
  :urls => ["/media/images", "/media/js", "/media/css"],
  :root => "public"

class Dispatcher

  def self.call(env)
    @request = Rack::Request.new env
    @req_path = @request.path_info
    @req_method = @request.request_method
    @req_params = @request.params
    controller_obj, action, id = Router.call(@req_path, @req_method, @req_params)






  end
end
run Dispatcher
