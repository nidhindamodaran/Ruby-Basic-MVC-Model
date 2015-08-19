require_relative 'main_controller'
require './app/models/person.rb'

class PersonController < MainController
  def initialize(id, params)
    @id= id
    @params = params
  end

  def index()
    @person = Person.all
    @person.each do |person|
      puts person.username
    end
    render "index"
  end

  def show()
    begin
      @res = Person.find("#{@id}")
      render "person"
    rescue
      render "fail"
    end
  end

end
