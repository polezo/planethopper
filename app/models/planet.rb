class Planet < ActiveRecord::Base
    has_many :landings
    has_many :users, through: :landings

    
    def encounter(player)
        chance = rand(1..2)
        if chance == 1
            puts self.good_scenario
            wait = gets.chomp
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
        wait = gets    
    end
    
    def lookup_planet_stats
        if self.creator == nil
            puts "This planet was here since the beginning of time, no one knows who created it!"
        else
            puts "This planet was created by Master of the Universe #{self.creator}"
        end
        if self.champion == nil
            puts "This planet currently does not have a champion and is ripe for the taking!!"
        else
            puts "#{self.champion} is the current champion of #{self.name}, but you can overtake them with a victory!"
        end
        new_line
        wait = gets.chomp
    end

end