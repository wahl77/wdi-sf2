class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.references :student
      t.references :instructor
      t.integer :week
      t.integer :day

      t.timestamps
    end
    add_index :meetings, :student_id
    add_index :meetings, :instructor_id
  end
end
