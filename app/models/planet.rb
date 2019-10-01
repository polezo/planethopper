class Planet < ActiveRecord::Base
    has_many :landings
    has_many :users, through: :landings

    
    def encounter(player)
        landing = Landing.create(player: player, planet: self)
        chance = rand(1..2)
        if chance == 1
            puts self.good_scenario
            player.life += 2
        else
            puts self.bad_scenario
            player.life -= 5
            if player.life == 0
                landing.died = true
                landing.save
            end
        end
        wait = gets.chomp 
    end
    
    def lookup(player)
        puts "this planet was discovered by #{self.landings.first.player.name}"
        wait = gets.chomp
        player.on_planet_choice(self.name)
    end

end