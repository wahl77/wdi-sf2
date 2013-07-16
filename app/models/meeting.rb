class Meeting < ActiveRecord::Base
  belongs_to :student
  belongs_to :instructor
  attr_accessible :day, :week, :instructor_id, :student_id

  def day_name
    names = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
    names[day-1]
  end

  def self.all_meetings
    Rails.cache.fetch("meetingsdfadsfa") do 
      Meeting.joins(:student, :instructor).select("meetings.*, students.name as student_name, instructors.name as instructor_name, students.id as student_id").all
    end
  end

end
