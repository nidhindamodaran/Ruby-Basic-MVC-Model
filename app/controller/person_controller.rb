require_relative 'main_controller'

class PersonController < MainController
  def initialize(id)
    @id= id
  end

  def index()
      "THis in index page"
  end

  def show()
    "This is show page of #{@id}"
  end

end
