require './app/controller/person_controller.rb'
require './app/controller/session_controller.rb'

class Router
  def self.call(req_path, req_method, req_params, session)
    controller, action, id = get_url(req_path)
    obj = class_load(controller, action, id, req_params, session)
    # RETURNS
    [obj, action]
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
      when /^\/session\/(login_check)$/
        ["session","login_check", nil]
      when /^\/session\/(register)$/
        ["session","new",nil]
      when /^\/session\/(create)$/
        ["session","create",nil]
      when /^\/session\/(logout)$/
        ["session","logout",nil]
      else
        ["session","notfound",nil]
    end
  end

  def self.class_load(controller, action, id, params, session)
    cont_file = "./app/controller/"+controller+"_controller.rb"
    class_name = controller.capitalize + "Controller"
    ob = Module.const_get(class_name).new(id, params, session)

    return ob
  end

end
