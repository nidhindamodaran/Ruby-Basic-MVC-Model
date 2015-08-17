class Router
  def self.call(req_path, req_method, req_params)
    @req_path, @req_method, @req_params = req_path, req_method, req_params
    @controller, @action, @id = get_url(@req_path)
    obj = class_load(@controller)
    [obj, @action, @id]
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

  def self.class_load(controller)
    class_name = controller.capitalize + "Controller"
    ob = class_name.constantize.new

    return ob
  end

end
