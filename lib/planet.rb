# lib/planet.rb
module Planets
  class Planet
    attr_accessor :name, :life, :missiles_round, :type_planet, :code

    def initialize(name, life, missiles_round, type_planet)
      @name = name
      @life = life
      @missiles_round = missiles_round
      @type_planet = type_planet
    end

    def rest_missiles(missiles_attack)
      self.missiles_round -= missiles_attack
    end

    def healing(missiles_healing)
      self.life += missiles_healing / 2
      self.missiles_round -= missiles_healing
      "#{name} has been cured with #{missiles_healing} missiles."
    end

    def attack(missiles_attack, attacked)
      raise NotImplementedError, 'This method must be implemented by a subclass'
    end
  end
end
