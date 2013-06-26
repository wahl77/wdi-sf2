class Meeting < ActiveRecord::Base
  belongs_to :student
  belongs_to :instructor
  attr_accessible :day, :week, :instructor_id, :student_id
end
