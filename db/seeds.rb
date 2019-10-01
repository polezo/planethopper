Player.destroy_all
Planet.destroy_all
Landing.destroy_all


adam = Player.find_or_create_by(name: "Adam", life: 10)
khaled = Player.find_or_create_by(name: "Khaled", life: 10)

earth = Planet.find_or_create_by(name: "Earth",bad_scenario: "You've encountered a friggin shark with a laser!", good_scenario: "You won!")
mars = Planet.find_or_create_by(name: "Mars", bad_scenario: "You've encountered Marvin the Martian with a laser!", good_scenario: "You won!")
jupiter = Planet.find_or_create_by(name: "Jupiter",bad_scenario: "You've encountered a dinosaur with a laser!", good_scenario: "You won!")
pluto = Planet.find_or_create_by(name: "Pluto",bad_scenario: "You've encountered a Klingon with a laser!", good_scenario: "You won!")
venus = Planet.find_or_create_by(name: "Venus",bad_scenario: "You've encountered Darth Vader with a laser!", good_scenario: "You won!")
neptune = Planet.find_or_create_by(name: "Neptune",bad_scenario: "You've encountered a giraffe with a laser!", good_scenario: "You won!")
zebes = Planet.find_or_create_by(name: "Zebes",bad_scenario: "You've encountered a lizard with a laser!", good_scenario: "You won!")
coruscant = Planet.find_or_create_by(name: "Coruscant",bad_scenario: "You've encountered a lion with a laser!", good_scenario: "You won!")
zb931 = Planet.find_or_create_by(name: "Earth Three",bad_scenario: "You've encountered a frog with a laser!", good_scenario: "You won!")
hoth = Planet.find_or_create_by(name: "Hoth",bad_scenario: "You've encountered a ballerina with a laser!", good_scenario: "You won!")
earth2 = Planet.find_or_create_by(name: "Earth Two",bad_scenario: "You've encountered a blob with a laser!", good_scenario: "You won!")


landing1 = Landing.find_or_create_by(player: adam, planet: mars)