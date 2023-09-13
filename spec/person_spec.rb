require_relative 'spec_helper'

describe 'Person Class' do
  before :each do
    @person = Person.new(32, name: 'Albert', parent_permission: true)
    @person_two = Person.new(18, name: 'John', parent_permission: false)
    @book = Book.new('Title', 'Author')
  end

  it 'should validate person age' do
    expect(@person.age).to eq 32
  end

  it 'should validate person name' do
    expect(@person.name).to eq 'Albert'
  end

  it 'should validate person parent permission' do
    expect(@person.parent_permission).to eq true
  end

  it 'should validate can_use_services? method' do
    expect(@person.can_use_services?).to eq true
    expect(@person_two.can_use_services?).to eq true
  end

  it 'should validate add_rental method for person' do
    date = '2022-03-23'
    @person.add_rental(date, @book)
    expect(@person.rentals.length).to eq 1
  end
end
