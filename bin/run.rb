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
    landing = Landing.create(player: player, planet: Planet.find_by(name: chosen_planet))
    #binding.pry
    new_line
    if answer == 'lookup'
        Planet.find_by(name: chosen_planet).lookup_planet_stats
        puts "You have researched the planet, now you go out and explore what there is to see in this world"
        new_line
        wait = gets.chomp
    end
    Planet.find_by(name: chosen_planet).encounter(player)
    player.check_life
    if player.check_if_won
        player.create_planet(player)
        break
    end
    # elsif answer == "lookup"
    #     Planet.find_by(name: chosen_planet).lookup_planet_stats
    #     puts "You have researched the planet, now you go out and explore what there is to see in this world"
    #     Planet.find_by(name: chosen_planet).encounter(player)
    #     player.check_life
    #     if player.check_if_won
    #         player.create_planet(player)
    #         break
    #     end
    if player.life == 0
        puts "You died!! Game Over"
        break
    end
end







