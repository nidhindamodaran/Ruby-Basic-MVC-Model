require 'mysql'
require 'active_record'
require 'yaml'
require 'digest/md5'

dbconfig = YAML::load(File.open('./config/db.yml'))
ActiveRecord::Base.establish_connection(dbconfig)

class Person < ActiveRecord::Base
  
end
