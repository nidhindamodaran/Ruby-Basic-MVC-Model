require 'rack'
require 'rack/server'
require './router.rb'

class Dispatcher

  def self.call(env)
    @request = Rack::Request.new env
    @req_path = @request.path_info
    @req_method = @request.request_method
    @req_params = @request.params
    @path ||= Router.call(@req_path, @req_method, @req_params)
    [200, {}, ["helo"]]


  end
end
run Dispatcher
