require_relative 'main_controller'
require './app/models/person.rb'

class PersonController < MainController
  def initialize(id, params)
    @id= id
    @params = params
  end

  def index()
    render "index"
  end

  def show()
    render "person"
  end

end
