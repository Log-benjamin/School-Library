require_relative 'rental'
require 'json'

class Book
  attr_accessor :title, :author, :rentals, :id

  def initialize(title, author, id: nil)
    @id = id || rand(8..100)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    Rental.new(date, self, person)
  end

  def self.path
    'store/book.json'
  end

  def self.read_file
    book_store = []
    if Book.check_file
      JSON.parse(File.read(Book.path)).each do |element|
        book_store << Book.new(element['title'], element['author'], id: element['id'])
      end
    end
    book_store
  end

  def self.check_file
    File.exist?(Book.path)
  end

  def self.write_file(data = [])
    book_store = []
    data.each do |d|
      book_store << { id: d.id, title: d.title, author: d.author }
    end
    File.write(Book.path, JSON.generate(book_store))
  end
end
