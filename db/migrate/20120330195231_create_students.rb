class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :address
      t.string :contact, :limit => 11
      t.string :contact_type
      t.text :profile
      t.timestamps
    end
  end
end
