# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Student.find_or_create_by_email('moinhaidar@gmail.com') do |s|
  s.first_name = 'Moin'
  s.last_name = 'Haidar'
  s.mobile = '9999728238'
  s.active = true
end

Teacher.find_or_create_by_email('moinhaidar@gmail.com') do |t|
  t.first_name = 'Moin'
  t.last_name = 'Haidar'
  t.mobile = '9999728238'
  t.active = true
end

DEPARTMETS = ['IT', 'Engineering', 'Management']
SECTIONS = ['A', 'B', 'C']

DEPARTMETS.each do |department|
  SECTIONS.each do |section|
    Classroom.find_or_create_by_department_and_section(department, section)
  end
end

SUBJECTS = {'Ruby' => '3 Months', 'Rails' => '6 Months', 'MySQL' => '1 Year'}

SUBJECTS.each_pair do |k, v|
  Subject.find_or_create_by_title(k) do |s|
    s.duration = v
  end
end

Student.first.attendances.create(:att_date => (Date.today - 1).to_s(:db), :present => true)
Teacher.first.attendances.create(:att_date => (Date.today - 1).to_s(:db), :present => true)

Schedule.create(
  :student_id => Student.first,
  :teacher_id => Teacher.first,
  :classroom_id => Classroom.first,
  :subject_id => Subject.first, 
  :duration => '2 hours'
)
