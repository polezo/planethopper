class Planet < ActiveRecord::Base
    has_many :landings
    has_many :users, through: :landings

    
    def encounter(player, landing)
        chance = rand(1..2)
        if chance == 1
            puts self.good_alien
            wait = gets.chomp
            player.life += 2
        else
            puts self.bad_alien
            player.battle_choice(self)
            if player.life == 0
                landing.died = true
                landing.save
            end
        end
        puts "Your business on #{self.name} is finished! On to your next voyage!"
        wait = gets    
    end
    
    def deaths
        Landing.where("planet_id = ? AND died = ?", self.id, true).count    
    end

    def lookup_planet_stats
        self.landings.length == 1 ? text = "Congratulations! You are the first visitor to #{self.name}" : text = "#{self.name} has been landed on by #{self.landings.length - 1} explorers before you"
        puts text
        if self.creator == nil
            puts "It has been here since the beginning of time, no one knows who created it!"
        else
            puts "It was created by Master of the Universe #{self.creator}"
        end
        if self.champion == nil
            puts "It currently does not have a champion and is ripe for the taking!!"
        else
            puts "#{self.champion} is the current champion of #{self.name}, but you can overtake them with a victory!"
        end

        puts "#{self.deaths} past travellers have died on this planet!"
        
        new_line
        wait = gets.chomp
    end

end

def deaths
    Landing.count(:conditions => "id = self.id AND died = true")    
end
