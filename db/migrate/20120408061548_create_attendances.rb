class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.integer :targetable_id
      t.string :targetable_type
      t.date :att_date
      t.boolean :present, :default => false
      t.timestamps
    end
    
    add_index :attendances, [:targetable_id, :targetable_type]
    add_index :attendances, :att_date
    add_index :attendances, :present
    
  end
end
