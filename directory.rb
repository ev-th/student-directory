STUDENTS = [
  { name: 'Dr. Hannibal Lecter', cohort: :january, hobbies: ['villainy'], country_of_birth: 'Villainville',
    height: :tall },
  { name: 'Darth Vader', cohort: :february, hobbies: ['villainy'], country_of_birth: 'Villainville', height: :tall },
  { name: 'Nurse Ratched', cohort: :february, hobbies: ['villainy'], country_of_birth: 'Villainville', height: :tall },
  { name: 'Michael Corleone', cohort: :november, hobbies: ['villainy'], country_of_birth: 'Villainville',
    height: :tall },
  { name: 'Alex DeLarge', cohort: :november, hobbies: ['villainy'], country_of_birth: 'Villainville', height: :tall },
  { name: 'The Wicked Witch of the West', cohort: :november, hobbies: ['villainy'], country_of_birth: 'Villainville',
    height: :tall },
  { name: 'Terminator', cohort: :november, hobbies: ['villainy'], country_of_birth: 'Villainville', height: :tall },
  { name: 'Freddy Krueger', cohort: :november, hobbies: ['villainy'], country_of_birth: 'Villainville', height: :tall },
  { name: 'The Joker', cohort: :november, hobbies: ['villainy'], country_of_birth: 'Villainville', height: :tall },
  { name: 'Joffrey Baratheon', cohort: :november, hobbies: ['villainy'], country_of_birth: 'Villainville',
    height: :tall },
  { name: 'Norman Bates', cohort: :november, hobbies: ['villainy'], country_of_birth: 'Villainville', height: :tall }
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

def input_students_names_and_cohort
  students = []

  puts 'Please enter the names of the students'
  puts 'To finish, just hit return twice'
  name = gets.chomp

  until name.empty?
    students << { name: name }
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end

  months = %w[
    january february march april may june
    july august september october november december
  ]
  default_cohort = :november
  puts 'Now select the cohort for each new student, by entering the name of a month.'
  puts "Press enter to select default cohort (#{default_cohort})."
  students.each_with_index do |student, i|
    while true
      puts "Please enter the cohort for #{student[:name]}: "
      month = gets.chomp.downcase

      if months.include?(month)
        students[i][:cohort] = month.to_sym
        break
      end
      if month.empty?
        students[i][:cohort] = default_cohort
        break
      end
    end
  end
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

def centered_print(names, length)
  names.each do |student|
    puts student[:name].center(length)
  end
end

def print_using_loop(names)
  i = 0
  while i < names.length
    puts "#{i + 1}. #{names[i][:name]} (#{names[i][:cohort]} cohort)"
    i += 1
  end
end

def print_by_cohort(names)
  cohorts = names.map { |name| name[:cohort] }.uniq
  cohorts.each do |cohort|
    puts "Students in the #{cohort} cohort:"
    cohort_names = names.select { |name| name[:cohort] == cohort }
    puts cohort_names.map { |name| name[:name] }.join(', ')
  end
end

def select_by_first_letter(names, first_letter)
  names.select { |name| name[:name].downcase.start_with?(first_letter.downcase) }
end

def print_footer(names)
  puts "Overall, we have #{names.count} great #{names.count == 1 ? 'student' : 'students'}"
end

def length_of_longest_name(names)
  longest_length = 0
  names.each do |name|
    length = name[:name].length
    longest_length = length if length > longest_length
  end
  longest_length
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

def main_exercise_8_3
  print_header
  print_using_loop(STUDENTS)
  print_footer(STUDENTS)
end

def main_exercise_8_6
  print_header
  format_length = length_of_longest_name(STUDENTS)
  centered_print(STUDENTS, format_length)
  print_footer(STUDENTS)
end

def main_exercise_8_7
  students = input_students_names_and_cohort
  print_header
  print(students)
  print_footer(students)
end

def main_exercise_8_8
  print_header
  print_by_cohort(STUDENTS)
  print_footer(STUDENTS)
end

def main_with_interactivity
  students = input_students
  return if students.empty?

  print_header
  print(students)
  print_footer(students)
end

def main
  print_header
  print(STUDENTS)
  print_footer(STUDENTS)
end
