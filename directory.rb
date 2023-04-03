@students = []

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts '1. Input the students'
  puts '2. Show the students'
  puts '3. Save the list to students.csv'
  puts '4. Load the list from students.csv'
  puts '9. Exit'
end

def process(selection)
  case selection
  when '1'
    input_students
  when '2'
    show_students
  when '3'
    save_students
  when '4'
    load_students
  when '9'
    exit
  else
    puts "I don't know what you meant. Try again."
  end
end

def input_students
  puts 'Please enter the names of the students'
  puts 'To finish, just hit return twice'
  loop do
    name = STDIN.gets.chomp
    break if name.empty?

    add_student(name)
    puts "Now we have #{@students.count} students"
  end
end

def show_students
  print_header
  print_students_list(@students)
  print_footer(@students)
end

def print_header
  puts 'The students of Villains Academy'
  puts '-------------'
end

def print_students_list(names)
  names.each_with_index do |student, i|
    puts "#{i + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great #{names.count == 1 ? 'student' : 'students'}"
end

def save_students
  file = File.open('students.csv', 'w')
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(',')
    file.puts csv_line
  end
  file.close
end

def load_students(filename = 'students.csv')
  file = File.open(filename, 'r')
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_student(name, cohort)
  end
  file.close
end

def add_student(name, cohort = 'november')
  @students << { name: name, cohort: cohort.to_sym }
end

def load_students(filename = 'students.csv')
  file = File.open(filename, 'r')
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_student(name, cohort)
  end
  puts "Loaded #{@students.count} from #{filename}"
  file.close
end

def get_students_file
  filename = ARGV.first
  return 'students.csv' if filename.nil?
  return filename if File.exist?(filename)

  puts "Sorry #{filename} doesn't exist."
  exit
end

file = get_students_file
load_students(file)
interactive_menu
