require_relative 'base_decorator'
class CapitalzeDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
