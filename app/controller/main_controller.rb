require 'erb'

class MainController
  def render(template)
    rend_path = "../../views/layout/main.html.erb"
    path=File.expand_path(rend_path,__FILE__)
		ERB.new(File.read(path)).result(binding)
  end

  def render_view(template)
    rend_path = "../../views/person/#{template}.html.erb"
		path=File.expand_path(rend_path,__FILE__)
		ERB.new(File.read(path)).result(binding)
	end

end
