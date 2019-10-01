class Planet < ActiveRecord::Base
    has_many :landings
    has_many :users, through: :landings

    
    def encounter(player)
        Landing.create(player: player, planet: self)
        chance = rand(1..2)
        if chance == 1
            puts self.good_scenario
            player.life += 2
        else
            puts self.bad_scenario
            player.life -= 2
        end
        puts "You now have a life of #{player.life}"
    end
    
end