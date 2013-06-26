students = %w(
  Franky
  Isaac
  Elizabeth
  Neil
  Zara
  YKat
  Eric
  Alex
  Claire
  Adam
  Tom
  Amy
  Baylee
  Christina
  Patsy
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
  [3, 4, 5].include?(day)
end

def per_day(day)
  four_students?(day) ? 4 : 3
end

weeks = [5, 6, 7, 8, 9, 10, 11]
days = [1, 2, 3, 4, 5]
offsets = {1 => 0, 2 => 3, 3 => 6, 4 => 10, 5 => 14}

weeks.each_with_index do |week, i|
  puts "Starting Week #{week}"

  instructors = Instructor.all.rotate(i)

  days.each do |day|
    puts "Day #{day}:"

    students_with_meetings = Student.all.rotate(i*3 + offsets[day]).take(per_day(day))
    puts "1:1s with #{students_with_meetings.map{|s| s.name}.join(', ')} today."

    students_with_meetings.each do |student|
      instructor = instructors.rotate![0]
      student.meetings.create(instructor_id: instructor.id, week: week, day: day)
      puts "1:1 set for Week #{week}, Day #{day} - #{instructor.name} & #{student.name}"
    end

    puts "Moving on to next day.\n\n" unless i == 4
  end

  puts "Moving on to next week.\n\n"
end