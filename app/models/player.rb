class Player < ActiveRecord::Base
    has_many :landings
    has_many :planets, through: :landings
    has_many :weapons

    $prompt = TTY::Prompt.new
    
    def on_planet_choice(planet)
      puts "Congrats on safely arriving to #{planet}"
      explore_or_lookup = $prompt.select("Do you want to look up the history of this planet or do you want to explore??", ["Lookup", "Explore"])
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
        new_line
        puts "You are a master voyager of the Universe!!" 
        true
      end
    end

    def create_planet(player)
      while true
        puts "As a Master of the Universe you can now add your own planet! What would you like to name it? [Enter Planet Name]:"
        planet_name = gets.chomp
        if planet_name == ''
          new_line
          puts "You have to enter a planet name!!"
        else
          user_planet = Planet.create(name: planet_name, creator: player.name)
          new_line
          break
        end
      end
      while true
        puts "What good fortune could someone encounter on your planet? [Enter below]"
        good_scenario = gets.chomp
        if good_scenario == ''
          new_line
          puts "You must describe what good things happen on your planet!!"
        else
          user_planet.good_scenario = good_scenario
          new_line
          puts "Thanks for playing! A game by Khaled and Adam"
          break
        end
      end
      while true
        puts "And what trouble awaits those who vist your planet? [Enter below]"
        bad_scenario = gets.chomp
        if bad_scenario == ''
          new_line
          puts "You must describe the terror that awaits those who wander onto your planet!!"
        else
          user_planet.bad_scenario = bad_scenario
          new_line
          break
        end
      end
      user_planet.save
    end

    def battle_choice(planet)
      baddie_life = rand(3..6)
      while baddie_life > 0 && self.life > 0
        fight_or_run = $prompt.select("What will you do??", ["Fight", "Run"])
        if fight_or_run == "Fight"
          new_line
          puts "THE FIGHT IS ON!"
          puts "Press 'a' to attack"
          damage_given = 0
          answer2 = gets.chomp 
          new_line
          text = "ATTACKING NOW!"
          answer2.downcase == "a" ? damage_given = rand(0..3) : text = "that's not an attack! The enemy now has time to attack for free" 
          puts text
          wait = gets.chomp
          baddie_life -= damage_given
          puts "uh oh..." if damage_given == 0
          puts "You did #{damage_given} damage to your enemy, they have #{baddie_life} hit points left" 
          self.won_fight(planet) if baddie_life <= 0
          break if baddie_life <= 0
          puts "Enemy is now attacking. Press enter to try and dodge"
          wait = gets.chomp
          damage_taken = rand(0..3)
          self.life -= damage_taken
          damage_taken == 0 ? damage_text = "They missed! Nice dodge" : damage_text = "They still hit you!"
          puts damage_text
          puts "You took #{damage_taken} damage from the enemies attack. You have #{self.life} hit points left. Press enter to continue"
          wait = gets.chomp
        elsif fight_or_run == "Run"
          new_line
          puts "You try and run away"
          wait = gets.chomp
          succeed = rand(1..2)
          if succeed == 1
            puts "You successsfully run away"
            wait = gets.chomp
            break
          else 
            puts "Run away unsuccessful. They've got you cornered and got a free hit on you and you lost 2 life!"
            self.life -= 2
          end
        end
        if self.life <= 0
          check_life
          break
        end
        self
      end

    end

    def won_fight(planet)
      new_line
      puts "You won the fight! You are now the current champion of #{planet.name}!"
      planet.champion = self.name
      planet.save
      gets
    end

    def planets_created
      Planet.all.select{|planet|  ##returns an array of all the planet objects the player has created
        planet.creator == self.name}
    end

    def champion_of
      Planet.all.select{|planet|  ##returns an array of all the planet objects the player is the current champ
        planet.champion == self.name}
    end

    def planets_visited
      landings = Landing.all.select{|landing| ##array of all of the players landings
        landing.player_id == self.id}

      landings.map{|landing|      ## array of the names of every planet visited by player
        Planet.find_by(id: landing.planet_id).name}
    end

    def my_stats
      puts "You have created #{self.planets_created.count} planets!!!"
      puts "You are currently the champion of #{self.champion_of.count} planets!!!"
      puts "You have visted #{self.planets_visited.count} planets!!!"
    end

    def set_password
      while true
        new_line
        rocket = $prompt.decorate('🚀')
        password = $prompt.mask("Please set your password:", mask: rocket)
        if password != ''
          self.password = password
          self.save
          break
        end
      end
    end

end