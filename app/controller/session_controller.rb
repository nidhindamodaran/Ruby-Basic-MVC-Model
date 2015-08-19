require_relative 'main_controller'
require './app/models/person.rb'
require 'digest/md5'

class SessionController < MainController
  def initialize(id, params)
    @id = id
    @params = params
  end



  def login_check()
    username = @params['username']
    password = Secure.encrypt_md5(@params['password'])
    result = Person.find_by_username(username)
    if (result.present?) && (result.password == password)
      @status = 301
      '../../person'
    else
      puts @error_login = "Something went wrong please check your username password "
      login()
    end
  end
  def login()
    render "login"
  end

  def create()
    person = Person.new(@params)
    person.password = Secure.encrypt_md5(@params['password'])
    if person.save
      @status = 301
      'login'
    else
      puts @errors ||= person.errors.full_messages
      new()
    end

  end

  def new()
    render "registration"
  end

  def notfound()
    render "fail"

  end
end


class Secure
  require "digest"

  def self.encrypt_md5(pass)
    Digest::MD5.hexdigest pass
  end
end
