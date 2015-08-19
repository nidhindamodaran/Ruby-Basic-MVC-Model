require 'mysql'
require 'active_record'
require 'yaml'


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
  validates :username, presence:true, uniqueness:true, length: { minimum:5 , message: "Minimum length is 5"}
  validates :name, :dept , presence:true
  validates :age, presence:true, numericality: { only_integer: true, message: "Enter correct Age "}, length: { maximum: 2, message: "Entered Age is Incorrect"}
  validates :mob, presence:true, uniqueness:true, numericality: { only_integer: true, message: "Enter correct Mobile Number "}, length: { is: 10, message: "Please check Mobile Number" }
  validates :email, presence:true, uniqueness:true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "Enter correct Email"}
end
