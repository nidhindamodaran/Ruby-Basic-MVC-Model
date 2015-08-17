require_relative 'main_controller'

class PersonController < MainController
  def initialize(action)
    @action = action
  end
  def call(id = nil)
    "hello #{id}"
  end

  def index(id)

  end

  def show(id)

  end

end
