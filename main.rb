require_relative 'app'

def main
  my_app = App.new
  loop do
    my_app.options
    my_app.adjust_input
    my_app.validate(1, 7)
    my_app.action_dispatch
  end
end

main
