require_relative 'spec_helper'
describe 'Book Class' do
  before :each do
    @book = Book.new('Title', 'Author')
    @student = Student.new(25, name: 'Benjamin', parent_permission: true)
  end
  it 'validate book title correctly' do
    expect(@book.title).to eq 'Title'
  end
  it 'validate book author correctly' do
    expect(@book.author).to eq 'Author'
  end
  it 'validate add_rental method for student' do
    date = '2020-03-23'
    @book.add_rental(date, @student)
    expect(@book.rentals.length).to eq 1
  end
end