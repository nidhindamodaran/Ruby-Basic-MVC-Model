require './app/controller/person_controller.rb'
require './app/controller/session_controller.rb'

class Router
  def self.call(req_path, req_method, req_params)
    @req_path, @req_method, @req_params = req_path, req_method, req_params
    @controller, @action, @id = get_url(@req_path)
    obj = class_load(@controller, @action, @id)

    [obj, @action]
  end

  def self.get_url(path)
    case path

      when /^\/$/
        ["person","index", nil]

      when /^\/(person)$/
        ["person","index", nil]

      when /^\/(person)\/(\d+)?$/
        ["person","show","#{$2}"]
      when /^\/session\/(login)$/
        ["session","login", nil]
      when /^\/session\/(register)$/
        ["session","create",nil]
    end
  end

  def self.class_load(controller, action, id)
    cont_file="./app/controller/"+controller+"_controller.rb"
		load cont_file
    class_name = controller.capitalize + "Controller"
    ob = Module.const_get(class_name).new(id)

    return ob
  end

end
