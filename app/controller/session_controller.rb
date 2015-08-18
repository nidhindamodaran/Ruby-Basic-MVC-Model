require_relative 'main_controller'

class SessionController < MainController
  def initialize(id)
    @aid = id
  end

  def login()
    render "login"
  end

  def create()
    render "registration"
  end
end
