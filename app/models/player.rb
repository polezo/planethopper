class Player < ActiveRecord::Base
    has_many :landings
    has_many :planets, through: :landings
    
    def create_planet(name)
        Planet.create(name: "name")
    end

    def on_planet_choice(planet)
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

end