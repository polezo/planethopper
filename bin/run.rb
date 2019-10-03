require_relative "../config/environment"

welcome
player = start
return nil if !player ##ends the game if someone tries to log in as existing player and provides incorrect password

new_line
puts "Here are your stats so far!"
gets.chomp
new_line

player.my_stats
gets


new_line
puts "You are off on an adventure and have enough gas to travel to one of the planets below"

alive = true

while alive
    new_line
    chosen_planet = planets_available_to_player(player)
    puts"    
        !
        !
        ^
       / \\
      /___\\
     |=   =|
     | P H |
     | L O |
     | A P |
     | N P |
     | E E |
     | T R |
     |     |
     |     |
     |     |
    /|##!##|\\
   / |##!##| \\
  /  |##!##|  \\
 |  / ^ | ^ \\  |
 | /  ( | )  \\ |
 |/   ( | )   \\|"+
 ColorizedString["
     ((   ))
    ((  :  ))
    ((  :  ))
     ((   ))
      (( ))
       ( )
        .
        .
     "].colorize(:light_red)
    new_line
    answer = player.on_planet_choice(chosen_planet)
    landing = Landing.create(player: player, planet: Planet.find_by(name: chosen_planet))
    new_line
    if answer == 'Lookup'
        Planet.find_by(name: chosen_planet).lookup_planet_stats
        puts "You have researched the planet, now you go out and explore what there is to see in this world"
        new_line
        wait = gets.chomp
    end
    Planet.find_by(name: chosen_planet).encounter(player, landing)
    player.check_life
    if player.check_if_won
        player.create_planet(player)
        break
    end
    if player.life == 0
        puts "You died!! Game Over"
        break
    end
end







