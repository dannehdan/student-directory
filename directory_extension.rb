def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_long(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    puts "They enjoy #{student[:hobbies]}, born in #{student[:country_of_birth]} and are #{student[:height]}cm tall"
  end
end

def print_while(students)
  index = 0
  while index < students.length do
    puts "#{students[index][:name]} (#{students[index][:cohort]} cohort)"
    index += 1
  end
end

def print_with_first_letter(students)
  puts "Which letter would you like to view"
  letter = gets.chomp
  students.each do |student|
    if student[:name][0,1].upcase == letter.upcase
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    else
    end
  end
end

def print_short_names(students)
  students.each do |student|
    if student[:name].length < 12
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    else
    end
  end
end

def print_footer(names)
  footer =  " Overall, we have #{names.count} great students ".center(100,"-")
  puts footer
end

def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"

  # create an empty array
  students = []

  # get the first name
  name = gets.chomp

  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student has to the array
    puts "Which cohort are they in?"
    cohort = gets.chomp
    cohort == "" ? cohort = :november : cohort
    students << {name: name, cohort: cohort.to_sym}
    puts "Now we have #{students.count} students"

    # get another name from the user
    puts "Next student name"
    name = gets.chomp
  end

  # return the array of students
  students
end

def input_students_long
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"

  # create an empty array
  students = []

  # get the first name
  name = gets.chomp

  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the students to the array
    puts "What are their hobbies"
    hobbies = gets.chomp
    puts "What is their country of birth?"
    cob = gets.chomp
    puts "What is their height?"
    height = gets.chomp
    students << {
      name: name,
      cohort: :november,
      hobbies: hobbies,
      country_of_birth: cob,
      height: height
    }
    
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Next student name"
    name = gets.chomp
  end

  # return the array of students
  students
end

# students = input_students_long
students = input_students
print_header
print(students)
# print_long(students)
# print_while(students)
print_footer(students)
# print_with_first_letter(students)
# print_short_names(students)