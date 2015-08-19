require './app/controller/person_controller.rb'
require './app/controller/session_controller.rb'

class Router
  attr_reader :routes
end

def initialize
  @routes = Hash.new { |hash, key| hash[key] = [] }
end
