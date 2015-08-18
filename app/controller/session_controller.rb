require_relative 'main_controller'
require './app/models/person.rb'

class SessionController < MainController
  def initialize(id, params)
    @id = id
    @params = params
  end

  def login()
    render "login"
  end

  def create()
    person = Person.new(@params)




  end

  def new()
    render "registration"
  end
end
