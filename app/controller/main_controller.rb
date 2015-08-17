require 'erb'

class MainController
  def render(template)
    path=File.expand_path("./app/views/layout/main.html.erb",__FILE__)
		ERB.new(File.read(path)).result(binding)
  end

  def render_view(template)
		path=File.expand_path("./app/views/person/#{template}.html.erb",__FILE__)
		ERB.new(File.read(path)).result(binding)
	end

end
