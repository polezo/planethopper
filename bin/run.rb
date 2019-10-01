require_relative "../config/environment"

welcome
player = start

new_line
puts "You are off on an adventure and have enough gas to travel to one of the planets below: [Enter planet name]"

alive = true

while alive
    new_line
    chosen_planet = planets_available_to_player(player)
    new_line
    answer = player.on_planet_choice(chosen_planet)
    new_line
    if answer == "explore"
        Planet.find_by(name: chosen_planet).encounter(player)
        player.check_life
        break if player.check_if_won
    elsif answer == "lookup"
        Planet.find_by(name: chosen_planet).lookup_planet_stats
        player.on_planet_choice(chosen_planet)
    end
    if player.life == 0
        puts "You died!! Game Over"
        break
    end
end





