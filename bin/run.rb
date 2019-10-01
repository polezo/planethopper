require_relative "../config/environment"

welcome
player = start
player_lv2 = liftoff(player)

while player.check_life > 0
space_navigate(player_lv2)

end





