require_relative 'spec_helper'
describe TrimmerDecorator do
  it 'Trim a given name to 10 characters' do
    nameable = Nameable.new
    allow(nameable).to receive(:correct_name).and_return('QuantemMechanics')
    base_dec = BaseDecorator.new(nameable)
    trim_dec = TrimmerDecorator.new(base_dec)
    result = trim_dec.correct_name
    expect(result).to eq('QuantemMec')
  end
end