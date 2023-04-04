class InteractiveMenu
  def initialize(student_body)
    @students = student_body
  end

  def main_loop
    file = get_csv_file
    @students.load_students(file)
    loop do
      print_options
      process(STDIN.gets.chomp)
    end
  end

  def print_options
    puts '1. Input the students'
    puts '2. Show the students'
    puts '3. Save the list to students.csv'
    puts '4. Load the list from students.csv'
    puts '9. Exit'
  end

  def process(selection)
    case selection
    when '1'
      @students.input_students
    when '2'
      @students.show_students
    when '3'
      @students.save_students
    when '4'
      @students.load_students
    when '9'
      exit
    else
      puts "I don't know what you meant. Try again."
    end
  end
end

class StudentBody
  def initialize
    @students = []
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
    print_students_list
    print_footer
  end

  def print_header
    puts 'The students of Villains Academy'
    puts '-------------'
  end

  def print_students_list
    @students.each_with_index do |student, i|
      puts "#{i + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end

  def print_footer
    puts "Overall, we have #{@students.count} great #{@students.count == 1 ? 'student' : 'students'}"
  end

  def save_students
    open(DEFAULT_STUDENT_FILE, 'w') do |file|
      @students.each do |student|
        student_data = [student[:name], student[:cohort]]
        csv_line = student_data.join(',')
        file.puts csv_line
      end
    end
    puts "Data saved to #{DEFAULT_STUDENT_FILE}."
  end

  def add_student(name, cohort = 'november')
    @students << { name: name, cohort: cohort.to_sym }
  end

  def load_students(filename = DEFAULT_STUDENT_FILE)
    open(filename, 'r') do |file|
      file.readlines.each do |line|
        name, cohort = line.chomp.split(',')
        add_student(name, cohort)
      end
      puts "Loaded #{@students.count} from #{filename}"
    end
  end
end

def get_csv_file
  filename = ARGV.first
  return DEFAULT_STUDENT_FILE if filename.nil?
  return filename if File.exist?(filename)

  puts "Sorry #{filename} doesn't exist."
  exit
end

DEFAULT_STUDENT_FILE = 'students.csv'
students = StudentBody.new
menu = InteractiveMenu.new(students)
menu.main_loop
