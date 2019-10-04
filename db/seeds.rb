Player.destroy_all
Planet.destroy_all
Landing.destroy_all


# adam = Player.find_or_create_by(name: "Adam", life: 10)
# khaled = Player.find_or_create_by(name: "Khaled", life: 10)

earth = Planet.find_or_create_by(name: "Earth",bad_alien: "a friggin shark", good_alien: "space Bob Ross")
mars = Planet.find_or_create_by(name: "Mars", bad_alien: "Marvin the Martian", good_alien: "space Mr. Rogers")
jupiter = Planet.find_or_create_by(name: "Jupiter",bad_alien: "a dinosaur", good_alien: "your friendly IT professional")
pluto = Planet.find_or_create_by(name: "Pluto",bad_alien: "a klingon", good_alien: "space pizza delivery guys")
venus = Planet.find_or_create_by(name: "Venus",bad_alien: "Darth Vader", good_alien: "Darth Paul")
neptune = Planet.find_or_create_by(name: "Neptune",bad_alien: "a space giraffe", good_alien: "Admiral Joseph")
zebes = Planet.find_or_create_by(name: "Zebes",bad_alien: "a ninja lizard", good_alien: "Space Pilot Jenny")
coruscant = Planet.find_or_create_by(name: "Coruscant",bad_alien: "a bounty hunter space lion", good_alien: "Mario")
zb931 = Planet.find_or_create_by(name: "New Earth",bad_alien: "a space commander frog", good_alien: "Luke Skywalker")
hoth = Planet.find_or_create_by(name: "Hoth",bad_alien: "an astro-ballerina", good_alien: "space Abraham Lincoln")
earth2 = Planet.find_or_create_by(name: "ZB-937",bad_alien: "an icky blob", good_alien: "space Ghandi")


#landing1 = Landing.find_or_create_by(player: adam, planet: mars)

laser1 = Weapon.find_or_create_by(name: "Laser lv 1", damage_level: 2, dangerous?: false, player_id: 1)
laser2 = Weapon.find_or_create_by(name: "Laser lv 2", damage_level: 3, dangerous?: false)
laser3 = Weapon.find_or_create_by(name: "Acme Mega Laser", damage_level: 4, dangerous?: true)
laser4 = Weapon.find_or_create_by(name: "Master Laser", damage_level: 5, dangerous?: false)
fist = Weapon.find_or_create_by(name: "Fist", damage_level: 1, dangerous?: false)
space_revolover = Weapon.find_or_create_by(name: "Space Revolver", damage_level: 3, dangerous?: false)
acme_shotgun = Weapon.find_or_create_by(name: "Acme Shotgun", damage_level: 5, dangerous?: true)
grenade = Weapon.find_or_create_by(name: "Acme Grenade Launcher", damage_level: 6, dangerous?: true)
rocket_launcher = Weapon.find_or_create_by(name: "Rocket Launcher", damage_level: 6, dangerous?: false)
flame_thrower = Weapon.find_or_create_by(name: "Flame_Thrower", damage_level: 4, dangerous?: false)
knife_gun = Weapon.find_or_create_by(name: "Knife Gun", damage_level: 4, dangerous?: false)
acme_lightsword = Weapon.find_or_create_by(name: "Acme Lightsword", damage_level: 6, dangerous?: true)
gravity_beam = Weapon.find_or_create_by(name: "Gravity Beam", damage_level: 5, dangerous?: true)
laser_crossbow = Weapon.find_or_create_by(name: "Laser Crossbow", damage_level: 3, dangerous?: false)
