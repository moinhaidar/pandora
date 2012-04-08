class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.text :address
      t.string :mobile, :limit => 11
      t.string :phone, :limit => 11
      t.boolean :active, :default => false
      t.timestamps
    end
    
    add_index :teachers, [:first_name, :last_name]
    add_index :teachers, :email
    add_index :teachers, :active
    
  end
end
