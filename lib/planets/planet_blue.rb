# lib/planets/planet_blue.rb
require_relative '../planet'

module Planets
  class PlanetBlue < Planet
    def attack(missiles_attack, attacked)
      case attacked.type_planet
      when 'red'
        attacked.life -= missiles_attack * 2
      when 'green'
        attacked.life -= missiles_attack / 2
      when 'small'
        missiles_attack.times do
          attacked.life -= 1 if rand(2) == 1
        end
      else
        attacked.life -= missiles_attack
      end

      self.missiles_round -= missiles_attack
    end
  end
end
