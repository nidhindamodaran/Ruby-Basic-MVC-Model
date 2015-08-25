require 'erb'

class MainController
  attr :id, :params, :status, :session
  def initialize(id ,params, session)
    @id = id
    @params = params
    @session = session

  end

  def redirect_to path
    @status = 301
    path
  end

  def getname(id)
    Person.find(id).name
  end

  def session_nil?
    @session[:user_id].nil?
  end

  def render(template)
    rend_path = "../../views/layout/main.html.erb"
    path=File.expand_path(rend_path,__FILE__)
		ERB.new(File.read(path)).result(binding)
    #Erubis::Eruby.new(File.read(path)).result(binding)
  end

  def render_view(template)
    rend_path = "../../views/person/#{template}.html.erb"
		path=File.expand_path(rend_path,__FILE__)
		ERB.new(File.read(path)).result(binding)
    #Erubis::Eruby.new(File.read(path)).result(binding)
	end

end
