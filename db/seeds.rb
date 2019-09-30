adam = Player.find_or_create_by(name: "Adam", life: 10)
khaled = Player.find_or_create_by(name: "Khaled", life: 10)

earth = Planet.find_or_create_by(name: "Earth")
mars = Planet.find_or_create_by(name: "Mars")
jupiter = Planet.find_or_create_by(name: "Jupiter")
pluto = Planet.find_or_create_by(name: "Pluto")
venus = Planet.find_or_create_by(name: "Venus")
neptune = Planet.find_or_create_by(name: "Neptune")

landing1 = Landing.find_or_create_by(player: adam, planet: mars)