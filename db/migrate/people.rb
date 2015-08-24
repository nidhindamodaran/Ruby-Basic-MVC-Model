class Person< ActiveRecord::Migration
  def up
    puts "Entered in Up method"
    create_table(:people,force:true, primary_key:'id')do |t|
       t.column :username
       t.column :password
       t.column :name
       t.column :age
       t.column :mob
       t.column :dept
       t.column :email
    end
    def down
      puts "Entered in down method"
    	drop_table :people
    end
  end
end
