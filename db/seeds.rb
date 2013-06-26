students = %w(
  Neil
  Zara
  YKat
  Eric
  Elizabeth
  Claire
  Tom
  Christina
  Isaac
  Alex
  Amy
  Baylee
  Franky
  Patsy
  Adam
  Jason
  Gabe
  Harrison
)

instructors = %w(Dwayne Sumeet Jane)

students.each {|s| Student.create(name: s)}
puts "Added #{Student.count} students."

instructors.each {|i| Instructor.create(name: i)}
puts "Added #{Instructor.count} instructors."

puts "------------------------------------------------------------------------"

def four_students?(day)
  [2, 3, 4].include?(day)
end

def per_day(day)
  four_students?(day) ? 4 : 3
end

weeks = [5, 6, 7, 8, 9, 10, 11]
days = [1, 2, 3, 4, 5]
offsets = {1 => 0, 2 => 3, 3 => 7, 4 => 11, 5 => 14}
instructors = Instructor.scoped

weeks.each_with_index do |week, i|
  puts "Starting Week #{week}"

  days.each do |day|
    puts "Day #{day}:"

    students_with_meetings = Student.all.rotate(i*3 + offsets[day]).take(per_day(day))
    puts "1:1s with #{students_with_meetings.map{|s| s.name}.join(', ')} today."

    students_with_meetings.each do |student|
      instructor = instructors.rotate![0]
      student.meetings.create(instructor_id: instructor, week: week, day: day)
      puts "1:1 set for Week #{week}, Day #{day} - #{instructor.name} & #{student.name}"
    end

    puts "Moving on to next day.\n\n" unless i == 4
  end

  puts "Moving on to next week.\n\n"
end