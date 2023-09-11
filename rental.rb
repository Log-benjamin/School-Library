require 'date'

class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @book.rentals << book
    @person = person
    @person.rentals << book
  end

  def to_s
    "Book-#{@book}, Date: #{@date}"
  end
end
