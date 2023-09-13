require_relative 'spec_helper'

describe 'classroom Class' do
  before :each do
    @classroom = Classroom.new('Class A')
    @student = Student.new(15, name: 'marvin', parent_permission: false)
  end

  it 'should validate classroom label' do
    expect(@classroom.label).to eq 'Class A'
  end

  it 'should validate add_student method' do
    @classroom.add_student(@student)
    expect(@classroom.students.length).to eq 1
  end
end
