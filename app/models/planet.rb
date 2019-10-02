class Planet < ActiveRecord::Base
    has_many :landings
    has_many :users, through: :landings

    
    def encounter(player)
        #landing = Landing.create(player: player, planet: self)
        chance = rand(1..2)
        if chance == 1
            puts self.good_scenario
            player.life += 2
        else
            puts self.bad_scenario
            player.battle_choice(self)
            if player.life == 0
                landing.died = true
                landing.save
            end
        end
        puts "Your business on #{self.name} is finished! On to your next voyage!"    
    end
    
    def lookup_planet_stats
        if self.creator == nil
            puts "This planet was here since the beginning of time, no one knows who created it!"
        else
            puts "This planet was created by Master of the Universe #{self.creator}"
        end
            new_line
    end

end