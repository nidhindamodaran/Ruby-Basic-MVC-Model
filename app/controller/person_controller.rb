require_relative 'main_controller'

class PersonController < MainController
  def initialize(id)
    @id= id
  end

  def index()
    render "index"
  end

  def show()
    render "person"
  end

end
