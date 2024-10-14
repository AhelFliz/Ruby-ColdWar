class CreatePlanets
  def self.start
    puts 'Create Planets..'.blue
    number_of_teams
    define_names
  end

  def number_of_teams
    loop do
      puts 'How many teams would you like to add?'.green
      @number_of_teams = gets.chomp.to_i
    rescue StandardError
      puts 'Enter a number. Please try again.'
    end
  end

  def define_names
    @names = []
    @number_of_teams.times do
      name = get_unique_name
      planet = get_valid_planet_type
      save_planets(name, planet)
    end
  end

  def save_planets(name, planet)
    case planet
    when 'blue'
      planet = Planets::PlanetBlue.new(name, 200, 50, planet, 220)
    when 'small'
      planet = Planets::PlanetSmall.new(name, 200, 50, planet, 220)
    end

    @list_of_teams << planetc
    puts 'saved planet!'.green
  end

  def get_unique_name
    name = ''
    loop do
      puts 'Enter the name:'
      name = gets.chomp

      if @names.include? name
        puts "The name '#{name}' is already taken. Please choose a different name".red
      else
        @names << name
        break
      end
    end
    name
  end

  def get_valid_planet_type
    planet_type = ''
    loop do
      puts 'Enter a valid type (blue/small): '
      planet_type = gets.chomp

      if %w[blue small].include?(planet_type)
        break
      else
        puts "Invalid planet type. Please enter 'blue' or 'small'.".red
      end
    end
    planet_type
  end

  def self.list_of_teams
    @list_of_teams = []
  end
end

