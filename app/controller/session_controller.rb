require_relative 'main_controller'
require './app/models/person.rb'
require 'digest/md5'

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
    person.password = Secure.encrypt_md5(@params['password'])
    if person.save
      @status = 301
      'login'
    else
      @status = 301
      'register'
    end

  end

  def new()
    render "registration"
  end
end


class Secure
  require "digest"

  def self.encrypt_md5(pass)
    Digest::MD5.hexdigest pass
  end
end
