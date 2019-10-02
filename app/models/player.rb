class Player < ActiveRecord::Base
    has_many :landings
    has_many :planets, through: :landings
    
    def create_planet(name)
        Planet.create(name: "name")
    end

    def on_planet_choice(planet)
      landing = Landing.create(player: self, planet: Planet.find_by(name: planet))
      puts "Congrats on safely arriving to #{planet}"
      puts "Do you want to look up the history of this planet or do you want to explore?? Enter 'lookup' or 'explore'"
      answer = gets.chomp
      if answer == "explore"
        return "explore"
      elsif answer == "lookup" 
        return "lookup"
      end
      player
    end

    def check_life
      if self.life <= 0
        puts "Game Over"
      else
        puts "You now have a life of #{self.life}"
      end
        self.life
    end

    def check_if_won
      if self.planets.count == 8
        puts "You are a master voyager of the Universe!!" 
        true
      end
    end

    def create_planet(player)
      puts "As a Master of the Universe you can now add your own planet! What would you like to name it?"
      planet_name = gets.chomp.capitalize
      user_planet = Planet.create(name: planet_name, creator: player.name)
      puts "What good fortunate could someone encounter on your planet? [Enter below]"
      good_scenario = gets.chomp
      user_planet.good_scenario = good_scenario
      puts "And what trouble awaits those who vist your planet? [Enter below]"
      bad_scenario = gets.chomp
      user_planet.bad_scenario = bad_scenario
      user_planet.save
    end

end