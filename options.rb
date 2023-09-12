require_relative 'app'
class Options
  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/MethodLength
  def list_option
    my_app = App.new
    my_app.init_arrays
    main = Main.new
    loop do
      choice = main.menu_list
      case choice
      when 1
        my_app.books
      when 2
        my_app.people
      when 3
        my_app.add_person
      when 4
        my_app.add_book
      when 5
        my_app.add_rental
      when 6
        puts 'Enter person ID'
        id = gets.chomp.to_i
        my_app.all_personal_rentals(id)
      when 7
        puts 'Thank you for using this app!'
        my_app.save_file
        break
      else
        puts 'Your input is Invalid'
      end
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/MethodLength
end