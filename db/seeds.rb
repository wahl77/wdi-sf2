students = %w(
  Eric
  Elizabeth
  Claire
  Tom
  Neil
  Zara
  YKat
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

instructors = %w(Sumeet Dwayne Jane)

students.each {|s| Student.create(name: s)}
instructors.each {|i| Instructor.create(name: i)}