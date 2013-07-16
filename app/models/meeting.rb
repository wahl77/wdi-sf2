class Meeting < ActiveRecord::Base
  belongs_to :student
  belongs_to :instructor
  attr_accessible :day, :week, :instructor_id, :student_id

  def day_name
    names = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
    names[day-1]
  end

end
