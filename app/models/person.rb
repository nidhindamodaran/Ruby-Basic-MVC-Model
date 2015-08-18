require 'mysql'
require 'active_record'
require 'yaml'
require 'digest/md5'

dbconfig = YAML::load(File.open('./config/db.yml'))
ActiveRecord::Base.establish_connection(dbconfig)
=begin
ActiveRecord::Schema.define do
  create_table(:people,force:true, primary_key:'id')do |t|
     t.column :username, :string, limit:80
     t.column :password, :string, limit:80
     t.column :name, :string, limit:80
     t.column :age, :integer
     t.column :mob, :string, limit:20
     t.column :dept, :string, limit:80
     t.column :email, :string, limit:80
  end
end
=end

class Person < ActiveRecord::Base

end
