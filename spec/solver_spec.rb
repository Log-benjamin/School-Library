require_relative 'spec_helper'
describe Solver do
  before(:each) do
    @solver = Solver.new
  end
  it 'returns factorial of a number' do
    expect(@solver.factorial(5)).to eq(120)
    expect(@solver.factorial(0)).to eq(1)
    expect { @solver.factorial(-3) }.to raise_error(RangeError, 'Only positive values allowed')
  end
  it 'reverse a given word' do
    expect(@solver.reverse('Microverse')).to eq('esrevorciM')
    expect(@solver.reverse('Ruby')).to eq('ybuR')
    expect(@solver.reverse('hello')).to eq('olleh')
  end
  it 'returns the correct string' do
    expect(@solver.fizzbuzz(2)).to eq('2')
    expect(@solver.fizzbuzz(9)).to eq('fizz')
    expect(@solver.fizzbuzz(10)).to eq('buzz')
    expect(@solver.fizzbuzz(15)).to eq('fizzbuzz')
  end
end
