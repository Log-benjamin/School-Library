require_relative 'options'
class Main
  def menu_list
    puts ''
    puts 'Welcome to School Library App!'
    puts ''
    puts 'Please choose an option by entering a number: '
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a renal'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    gets.chomp.to_i
  end
end
display = Options.new
display.list_option