require_relative 'main_controller'
require './app/models/person.rb'

class PersonController < MainController
  def index
    user_id =  @session[:user_id]
    puts user_id.nil?
    if user_id.nil?
      render "login"
    else
      @person = Person.all
      @person.each do |person|
        person.username
      end
      render "index"
    end
  end

  def show
    user_id = @session[:user_id]
    if user_id.nil?
      render "login"
    else
    begin
      @res = Person.find(@id)
      render "person"
    rescue
      render "fail"
    end
  end
  end

end
