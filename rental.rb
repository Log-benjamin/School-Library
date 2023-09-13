class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    book.rentals << self
    @person = person
    person.rentals << self
  end

  def self.path
    'store/rental.json'
  end

  def self.write_file(data = [])
    rental_store = []
    data.each do |d|
      rental_store << { date: d.date, person_id: d.person.id, book_id: d.book.id }
    end
    File.write(Rental.path, JSON.generate(rental_store))
  end

  def self.read_file(people, books)
    rental_store = []
    if Rental.check_file
      JSON.parse(File.read(Rental.path)).each do |element|
        person = people.select { |p| p.id == element['person_id'] }[0]
        book = books.select { |b| b.id == element['book_id'] }[0]
        rental_store << Rental.new(element['date'], book, person)
      end
    end
    rental_store
  end

  def self.check_file
    File.exist?(Rental.path)
  end
end
