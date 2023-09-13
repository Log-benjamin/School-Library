require_relative 'spec_helper'
describe 'Rental Class' do
  before :each do
    date = '2023-09-13'
    @book = Book.new('Outwitting the Devil', 'Napoleon Hill')
    @student = Student.new(28, name: 'Mariana', parent_permission: false)
    @rental = Rental.new(date, @book, @student)
  end

  it 'should validate rental date' do
    expect(@rental.date).to eq '2023-09-13'
  end

  it 'should validate person name exists' do
    expect(@rental.person.name).to eq 'Mariana'
  end

  it 'should validate book title exists' do
    expect(@rental.book.title).to eq 'Outwitting the Devil'
  end

  it 'should validate book author exists' do
    expect(@rental.book.author).to eq 'Napoleon Hill'
  end
end
