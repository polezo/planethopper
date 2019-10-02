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
      planet
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

    def battle_choice(planet)
      baddie_life = rand(3..6)
      while baddie_life > 0 && self.life > 0
        puts "What will you do??...type 'F' to fight or 'R' to try and run away"
        answer = gets.chomp
        if answer.downcase == "f"
          new_line
          puts "THE FIGHT IS ON!"
          puts "Press 'a' to attack"
          damage_given = 0
          answer2 = gets.chomp 
          new_line
          text = "ATTACKING NOW!"
          answer2.downcase == "a" ? damage_given = rand(0...3) : text = "that's not an attack! The enemy now has time to attack for free" 
          puts text
          baddie_life -= damage_given
          puts "uh oh..." if damage_given == 0
          puts "You did #{damage_given} damage to your enemy, they have #{baddie_life} hit points left" 
          self.won_fight(planet) if baddie_life <= 0
          break if baddie_life <= 0
          puts "Enemy is now attacking. Press enter to try and dodge"
          wait = gets.chomp
          damage_taken = rand(0..3)
          self.life -= damage_taken
          damage_taken == 0 ? damage_text = "they missed! Nice dodge" : damage_text = "they still hit you!"
          puts damage_text
          puts "You took #{damage_taken} damage from the enemies attack. you have #{self.life} hit points left. Press enter to continue"
          wait = gets.chomp
        elsif answer.downcase == "r" 
          puts "you try and run away"
          succeed = rand(1..2)
          if succeed == 1
            puts "you successsfully run away"
            break
          else 
            puts "Run away unsuccessful. They've got you cornered and got a free hit on you and you lost 2 life!"
            self.life -= 2
          end
        else
          puts "That is not an option! Choose a correct option quickly a laser is being aimed at you!!"
        end
        if self.life <= 0
          check_life
          break
        end
        self
      end

    end

    def won_fight(planet)
      puts "you won the fight! You are now the champion of #{planet.name}"
    end

end