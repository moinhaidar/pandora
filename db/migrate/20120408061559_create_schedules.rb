class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :student_id
      t.integer :teacher_id
      t.integer :subject_id
      t.integer :classroom_id
      t.string :duration
      t.timestamps
    end
    
    add_index :schedules, :student_id
    add_index :schedules, :teacher_id
    add_index :schedules, :subject_id
    add_index :schedules, :classroom_id
    add_index :schedules, :duration
    
  end
end
