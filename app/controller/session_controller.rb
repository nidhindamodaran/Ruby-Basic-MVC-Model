require_relative 'main_controller'
require './app/models/person.rb'
require 'digest/md5'

class SessionController < MainController
  def login_check()
    username = @params['username']
    password = Secure.encrypt_md5(@params['password'])
    result = Person.find_by_username(username)
    if (result.present?) && (result.password == password)
      puts result.id
      puts @session[:user_id]
      @session[:user_id] = result.id
      puts @session[:user_id]
      redirect_to "../../person"
    else
      @error_login = "Something went wrong please check your username password "
      render "login"
    end
  end

  def login()
    user_id = @session[:user_id]
    if user_id.nil?
      render "login"
    else
      redirect_to "/"
    end
  end

  def create()
    person = Person.new(@params)
    person.password = Secure.encrypt_md5(@params['password'])
    if person.save
      redirect_to "login"
    else
      @errors ||= person.errors.full_messages
      new()
    end

  end

  def new()
    user_id = @session[:user_id]
    if user_id.nil?
      render "registration"
    else
      redirect_to "/"
    end
  end

  def notfound()
    render "fail"

  end

  def logout()
    if !@session[:user_id].nil?
			@session.delete('user_id')
		end
		render "login"
  end
end


class Secure
  require "digest"

  def self.encrypt_md5(pass)
    Digest::MD5.hexdigest pass
  end
end
