class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :title
      t.string :duration
      t.timestamps
    end
    
    add_index :subjects, :title
  end
end
