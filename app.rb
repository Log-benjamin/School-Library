require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require 'date'

class App
  def initialize
    @input = nil
    @people = Person.read_file
    @books = Book.read_file
    @rentals_for_person = []
    @rentals = Rental.read_file(@people, @books)
    @options = ['List all books', 'List all people', 'Create a person', 'Create a book', 'Create a rental',
                'List all rentals for a given person id', 'Exit']
  end

  def options
    puts ''
    puts 'Welcome to School Library App!'
    @options.each_with_index { |option, ind| puts "#{ind + 1} #{option}" }
    puts 'Please choose an option by entering a number: '
    puts ''
  end

  def adjust_input
    @input = gets.chomp
  end

  def validate(start, limit)
    return if (start.to_s..limit.to_s).to_a.include?(@input)

    loop do
      puts "Invalid entry. Please type a number between #{start}..#{limit}"
      @input = adjust_input
      break if (start.to_s..limit.to_s).to_a.include?(@input)
    end
  end

  def permission?
    return true if @input.downcase == 'y'

    false
  end

  def action_dispatch
    case @input
    when 1.to_s
      display_list_of_books(1)
    when 2.to_s
      display_list_of_person(2)
    when 3.to_s
      person
    when 4.to_s
      book
    when 5.to_s
      rental
      p(@rentals)
    when 6.to_s
      find_rental
    else
      Book.write_file(@books)
      Person.write_file(@people)
      Rental.write_file(@rentals)
      exit(false)
    end
  end

  def age
    puts 'Age:'
    adjust_input
    validate(0, 120)
    @input
  end

  def name
    puts 'Name:'
    adjust_input
  end

  def student
    name_input = name
    age_input = age
    puts 'Has parent permission? [Y/N]:'
    adjust_input

    @people << Student.new(age_input, name: name_input, parent_permission: permission?)
    puts 'Student created successfully'
  end

  def teacher
    name_input = name
    age_input = age

    puts 'Specialization:'
    specialization = adjust_input

    @people << Teacher.new(age_input, specialization, name: name_input)
    puts 'Teacher created successfully'
  end

  def person
    puts 'Do you want to create student (1) or teacher (2)? [Input the number]:'
    adjust_input
    validate(1, 2)
    @input == '1' ? student : teacher
  end

  def book
    puts 'Title:'
    title = adjust_input
    puts 'Author:'
    author = adjust_input

    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def display_list_of_books(from = 1)
    if @books.empty?
      puts 'No Books Available'
    else
      @books.each_with_index do |book, index|
        print "#{index}) " if from == 5
        puts "Title: \"#{book.title}\", Author:#{book.author}"
      end
    end
  end

  def display_list_of_person(from = 2)
    if @people.empty?
      puts 'The record you request is empty'
    else
      @people.each_with_index do |person, index|
        print "#{index}) " if from == 5
        puts "[#{person.class}] Name:#{person.name}, ID: #{person.id}, Age:#{person.age}"
      end
    end
  end

  def find_person
    index = @input.to_i
    p(index)
    @people[index]
  end

  def rental
    puts 'Select a book from the following list by number'
    display_list_of_books(5)
    adjust_input
    validate(0, @books.length)
    book_for_rent = @books[@input.to_i]

    puts 'Select a person from the following list by number (not id)'
    display_list_of_person(5)
    adjust_input
    person_who_rent = find_person

    puts 'Date: YYYY-MM-DD'
    adjust_input
    @rentals << Rental.new(@input, book_for_rent, person_who_rent)
    puts 'Rental created successfully'
  end

  def find_rental
    @rentals_for_person = []
    print 'ID of Person: '
    adjust_input
    find_people_who_rent

    return puts "Rentals: No record found\n" if @rentals_for_person.empty?

    display_rentals
  end

  def find_people_who_rent
    @people.each { |person| @rentals_for_person = person.rentals if person.id == @input.to_i }
  end

  def display_rentals
    @rentals_for_person.each_with_index do |rent, index|
      num = index + 1
      puts "#{num}). Rental: Date: #{rent.date}, Book: #{rent.book.title}, Author: #{rent.book.author}\n"
    end
  end
end
