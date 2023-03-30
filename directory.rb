STUDENTS = [
  { name: 'Dr. Hannibal Lecter', cohort: :november },
  { name: 'Darth Vader', cohort: :november },
  { name: 'Nurse Ratched', cohort: :november },
  { name: 'Michael Corleone', cohort: :november },
  { name: 'Alex DeLarge', cohort: :november },
  { name: 'The Wicked Witch of the West', cohort: :november },
  { name: 'Terminator', cohort: :november },
  { name: 'Freddy Krueger', cohort: :november },
  { name: 'The Joker', cohort: :november },
  { name: 'Joffrey Baratheon', cohort: :november },
  { name: 'Norman Bates', cohort: :november }
]

def input_students
  students = []

  puts 'Please enter the names of the students'
  puts 'To finish, just hit return twice'
  name = gets.chomp

  until name.empty?
    students << { name: name, cohort: :november }
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def print_header
  puts 'The students of Villains Academy'
  puts '-------------'
end

def print(names)
  names.each_with_index do |student, i|
    puts "#{i + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def select_by_first_letter(names, first_letter)
  names.select { |name| name[:name].downcase.start_with?(first_letter.downcase) }
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def main_exercise_8_1
  puts 'Select first letter of students for listing: '
  letter = gets.chomp
  print_header
  filtered_names = select_by_first_letter(STUDENTS, letter)
  print(filtered_names)
  print_footer(filtered_names)
end

def main_exercise_8_2
  short_students = STUDENTS.select { |student| student[:name].length < 12 }
  print_header
  print(short_students)
  print_footer(short_students)
end

def main
  print_header
  print(STUDENTS)
  print_footer(STUDENTS)
end

def main_with_interactivity
  students = input_students
  print_header
  print(students)
  print_footer(students)
end
