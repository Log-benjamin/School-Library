require_relative 'spec_helper'

describe 'teacher Class' do
  before :each do
    @teacher = Teacher.new(27, 'CS', name: 'Emebet')
  end

  it 'should validate teacher age' do
    expect(@teacher.age).to eq 27
  end

  it 'should validate teacher name' do
    expect(@teacher.name).to eq 'Emebet'
  end

  it 'should validate teacher specialization' do
    expect(@teacher.specialization).to eq 'CS'
  end

  it 'should validate can_use_services? method' do
    expect(@teacher.can_use_services?).to eq true
  end
end
