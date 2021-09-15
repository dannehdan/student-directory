@students = []

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
	case selection
		when "1"
			input_students
		when "2"
			show_students
    when "3"
      save_students
    when "4"
      load_students
		when "9"
			exit
		else
			puts "I don't know what you mean, try again"
	end
end

def try_load_students
  filename = ARGV.first || "students.csv" # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    add_student(name, cohort)
  end
  file.close
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def add_student(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def print_menu
  puts "Enter a number for what you'd like to do"
  puts "1 - Input the students"
  puts "2 - Show the students"
  puts "3 - Save the list to students.csv"
  puts "4 - Load the student list"
  puts "9 - Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"

  # get the first name
  name = STDIN.gets.chomp

  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student has to the array
    add_student(name, :november)
    puts "Now we have #{@students.count} students"

    # get another name from the user
    name = gets.chomp
  end
end

try_load_students
interactive_menu