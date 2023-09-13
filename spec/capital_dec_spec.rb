require_relative 'spec_helper'
describe CapitalzeDecorator do
  it 'capitalize the first letter of a given word' do
    nameable = Nameable.new
    allow(nameable).to receive(:correct_name).and_return('javascript')
    base_dec = BaseDecorator.new(nameable)
    cap_dec = CapitalzeDecorator.new(base_dec)
    result = cap_dec.correct_name
    expect(result).to eq('Javascript')
  end
end