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

end