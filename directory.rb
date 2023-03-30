STUDENTS = [
  { name: 'Dr. Hannibal Lecter', cohort: :november, hobbies: ['villainy'], country_of_birth: 'Villainville',
    height: :tall },
  { name: 'Darth Vader', cohort: :november, hobbies: ['villainy'], country_of_birth: 'Villainville', height: :tall },
  { name: 'Nurse Ratched', cohort: :november, hobbies: ['villainy'], country_of_birth: 'Villainville', height: :tall },
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

def select_by_first_letter(names, first_letter)
  names.select { |name| name[:name].downcase.start_with?(first_letter.downcase) }
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
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

def main_with_interactivity
  students = input_students
  print_header
  print(students)
  print_footer(students)
end

def main
  print_header
  print(STUDENTS)
  print_footer(STUDENTS)
end

main_exercise_8_6
