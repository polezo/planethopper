class Player < ActiveRecord::Base
    has_many :landings
    has_many :planets, through: :landings
    
    def create_planet(name)
        Planet.create(name: "name")
    end

    def check_life
        if self.life <= 0
          puts "Game Over"
        else
          puts "You now have a life of #{self.life}"
        end
        self.life
      end

      def on_planet_choice(planet)
        puts "Congrats on safely arriving to #{planet}"
        puts "Do you want to look up the history of this planet or do you want to explore?? Enter 'lookup' or 'explore'"
        explore = gets.chomp
        if explore == "explore"
          puts "********************\n\n"
          Planet.all.find_by(name: planet).encounter(self)
        elsif explore == "lookup" 
          puts "********************\n\n"
          Planet.all.find_by(name: planet).lookup(self)
        end
        self
      end


end