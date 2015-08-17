class Router
  def self.call(req_path, req_method, req_params)
    @req_path, @req_method, @req_params = req_path, req_method, req_params
    @controller, @action, @id = get_url(@req_path)
    #return "hello"

  end

  def self.get_url(path)
    path_split = path.split("/")
    if path_split.count == 0 || path_split[1].eql?("index")
      ["person", "index", nil]
    end



  end
end
