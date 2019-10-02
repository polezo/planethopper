Player.destroy_all
Planet.destroy_all
Landing.destroy_all


adam = Player.find_or_create_by(name: "Adam", life: 10)
khaled = Player.find_or_create_by(name: "Khaled", life: 10)

earth = Planet.find_or_create_by(name: "Earth",bad_scenario: "You've encountered a friggin shark with a laser!", good_scenario: "You found a box of chocolate! Your health is increased.")
mars = Planet.find_or_create_by(name: "Mars", bad_scenario: "You've encountered Marvin the Martian with a laser!", good_scenario: "Bank error in your favor!! Your health is increased.")
jupiter = Planet.find_or_create_by(name: "Jupiter",bad_scenario: "You've encountered a dinosaur with a laser!", good_scenario: "Hey there good looking! Your health is increased because you're so good lookin.")
pluto = Planet.find_or_create_by(name: "Pluto",bad_scenario: "You've encountered a Klingon with a laser!", good_scenario: "You found a medkit! Your health is increased.")
venus = Planet.find_or_create_by(name: "Venus",bad_scenario: "You've encountered Darth Vader with a laser!", good_scenario: "Your space ship just go upgraded with a medbay! Your health is increased")
neptune = Planet.find_or_create_by(name: "Neptune",bad_scenario: "You've encountered a giraffe with a laser!", good_scenario: "You found a beer! Your health is increased")
zebes = Planet.find_or_create_by(name: "Zebes",bad_scenario: "You've encountered a lizard with a laser!", good_scenario: "You found avocado toast! Your health is increased")
coruscant = Planet.find_or_create_by(name: "Coruscant",bad_scenario: "You've encountered a lion with a laser!", good_scenario: "You found gold! Your health is increased")
zb931 = Planet.find_or_create_by(name: "Earththree",bad_scenario: "You've encountered a frog with a laser!", good_scenario: "You found a good thing! Your health is increased")
hoth = Planet.find_or_create_by(name: "Hoth",bad_scenario: "You've encountered a ballerina with a laser!", good_scenario: "Hiya, I'm a magic health fairy and your health is increased!")
earth2 = Planet.find_or_create_by(name: "Earthtwo",bad_scenario: "You've encountered a blob with a laser!", good_scenario: "You got some medicine! Your health is increased")


#landing1 = Landing.find_or_create_by(player: adam, planet: mars)