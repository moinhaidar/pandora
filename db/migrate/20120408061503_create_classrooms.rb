class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.string :department
      t.string :section
      t.timestamps
    end
  end
end
