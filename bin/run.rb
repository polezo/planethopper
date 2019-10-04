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
gets

$alive = true

while $alive
    new_line
    chosen_planet = planets_available_to_player(player)
    rocket
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
    if answer == 'Store'
        Weapon.store(player)
        puts "On your way back to your ship, you ran into an alien!"
    end
    Planet.find_by(name: chosen_planet).encounter(player, landing)
    if player.check_if_won
        player.create_planet(player)
        break
    end
    if player.life <= 0
        puts "You died!! Game Over"
        break
    end
    puts "Your business on #{chosen_planet} is finished! On to your next voyage!"
    player.check_life
    wait = gets
end

puts "Thanks for playing! A game by Khaled and Adam"







