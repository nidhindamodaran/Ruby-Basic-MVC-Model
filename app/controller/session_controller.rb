require_relative 'main_controller'

class SessionController < MainController
  def initialize(id)
    @aid = id
  end

  def login()
    "This is login page"
  end

  def create()
    "This is Registration page"
  end
end
