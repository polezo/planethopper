class Planet < ActiveRecord::Base
    has_many :landings
    has_many :players, through: :landings

    
    def encounter(player, landing)
        baddie_intros = ["Oh no, you've run into ", "Watch out! You've encountered ", "Yikes, it's ", "There's ","Careful, that's "]
        baddie_weapons = [" a space tommy gun!"," laser nunchucks!"," laser nostril powers!"," a handful of poop ready to throw!"," space throwing stars!", " laser legos for you to step on!"]
        
        goodie_intros = ["Wow, it's ", "Hurray you've met ", "What luck! You've run into a ", "It's ", "Nice, it's ", "Cool beans, that's "]
        goodie_goodies = [" with treats just for you!", " holding a present for you!"," with something good for you!", " and it looks like they've got a gift for you!", " getting ready to give you a gift!"]
        
        chancey = rand(1..7)
        
        if chancey < 3
            puts goodie_intros.sample(1)[0] + self.good_alien + goodie_goodies.sample(1)[0]
            wait = gets.chomp
            amount = rand(1..4)*rand(1..2)
            if chancey == 1
            puts ColorizedString["It's a medkit! Your health has increased by #{amount}."].colorize(:green) 
            player.life += amount
            else
                player.dollars += amount
                puts ColorizedString["It's cold hard cash bby! Your cash stack has increased by #{amount}, which makes a total of #{player.dollars} dollars in your space wallet."].colorize(:green) 
            end
        else
            puts baddie_intros.sample(1)[0] + self.bad_alien + " with" + baddie_weapons.sample(1)[0]
            player.battle_choice(self)
            if player.life == 0
                landing.died = true
                landing.save
            end
        end
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
