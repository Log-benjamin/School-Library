class Rental
  def initialize(date, book)
    @date = date
    @book = book
    book.rentals << self
    @person = person
    person.rentals << self
  end

  attr_accessor :date, :book, :person
end
