class CreateTimetables < ActiveRecord::Migration
  def change
    create_table :timetables do |t|
      t.integer :user_id
      t.date :date
      t.integer :task_id
      t.text :comment
      t.integer :hours 	
      t.timestamps
    end
  end
end
