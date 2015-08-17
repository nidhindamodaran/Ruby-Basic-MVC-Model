require_relative 'main_controller'

class SessionController < MainController
  def initialize(action)
    @action = action
  end
  def call(action, id)
    "hello #{action}"
  end

  def login()

  end

  def create()

  end
end
