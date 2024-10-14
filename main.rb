Dir.glob(File.join(__dir__, 'lib', '**', '*.rb')).sort.each { |file| require_relative file }

class Main

  def start
    puts 'Game starting...'
    menu
    puts 'Hi'
  end

  def menu
    loop do
      puts 'Please select an option:'
      print "0 - EXIT\n1 - PLAY\n2 - GAME RULES\n3 - INFORMATION\n4 - MISSILES PER ROUND\n"\
              "5 - SHOW WINNING PLANETS\nResponse: "
      response = gets.chomp.to_i

      if response.negative? || response > 5
        puts 'Invalid option. Please try again.'
      elsif response.zero?
        abort('See you later!')
      elsif response == 2
        read_file_action
      elsif [1, 3, 4, 5].include?(response)
        break
      end
    rescue StandardError => e
      puts "An error occurred: #{e.message}. Please try again."
    end
  end

  def read_file_action
    puts "#{'-' * 100} \n #{FileHandler.red_file} \n #{'-' * 100}"
  end
end

blue_planet = Planets::PlanetBlue.new('Blue Planet', 100, 10, 'blue')
small_planet = Planets::PlanetSmall.new('Small Planet', 50, 5, 'small')

blue_planet.attack(3, small_planet)
puts small_planet.life

game = Main.new
game.start