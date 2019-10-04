Player.destroy_all
Planet.destroy_all
Landing.destroy_all


# adam = Player.find_or_create_by(name: "Adam", life: 10)
# khaled = Player.find_or_create_by(name: "Khaled", life: 10)

earth = Planet.find_or_create_by(name: "Earth",bad_alien: "You've encountered a friggin shark with a laser!", good_alien: "You found a box of chocolate! Your health is increased.")
mars = Planet.find_or_create_by(name: "Mars", bad_alien: "You've encountered Marvin the Martian with a laser!", good_alien: "Bank error in your favor!! Your health is increased.")
jupiter = Planet.find_or_create_by(name: "Jupiter",bad_alien: "You've encountered a dinosaur with a laser!", good_alien: "Hey there good looking! Your health is increased because you're so good lookin.")
pluto = Planet.find_or_create_by(name: "Pluto",bad_alien: "You've encountered a Klingon with a laser!", good_alien: "You found a medkit! Your health is increased.")
venus = Planet.find_or_create_by(name: "Venus",bad_alien: "You've encountered Darth Vader with a laser!", good_alien: "Your space ship just go upgraded with a medbay! Your health is increased")
neptune = Planet.find_or_create_by(name: "Neptune",bad_alien: "You've encountered a giraffe with a laser!", good_alien: "You found a beer! Your health is increased")
zebes = Planet.find_or_create_by(name: "Zebes",bad_alien: "You've encountered a lizard with a laser!", good_alien: "You found avocado toast! Your health is increased")
coruscant = Planet.find_or_create_by(name: "Coruscant",bad_alien: "You've encountered a lion with a laser!", good_alien: "You found gold! Your health is increased")
zb931 = Planet.find_or_create_by(name: "New Earth",bad_alien: "You've encountered a frog with a laser!", good_alien: "You found a good thing! Your health is increased")
hoth = Planet.find_or_create_by(name: "Hoth",bad_alien: "You've encountered a ballerina with a laser!", good_alien: "Hiya, I'm a magic health fairy and your health is increased!")
earth2 = Planet.find_or_create_by(name: "ZB-937",bad_alien: "You've encountered a blob with a laser!", good_alien: "You got some medicine! Your health is increased")


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
