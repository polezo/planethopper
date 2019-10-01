require_relative "../config/environment"


def welcome
    puts "                                                                   ..;===+.
                                                                .:=iiiiii=+=
                                                             .=i))=;::+)i=+,
                                                          ,=i);)I)))I):=i=;
                                                       .=i==))))ii)))I:i++
                                                     +)+))iiiiiiii))I=i+:'
                                .,:;;++++++;:,.       )iii+:::;iii))+i='
                             .:;++=iiiiiiiiii=++;.    =::,,,:::=i));=+'
                           ,;+==ii)))))))))))ii==+;,      ,,,:=i))+=:
                         ,;+=ii))))))IIIIII))))ii===;.    ,,:=i)=i+
                        ;+=ii)))IIIIITIIIIII))))iiii=+,   ,:=));=,
                      ,+=i))IIIIIITTTTTITIIIIII)))I)i=+,,:+i)=i+
                     ,+i))IIIIIITTTTTTTTTTTTI))IIII))i=::i))i='
                    ,=i))IIIIITLLTTTTTTTTTTIITTTTIII)+;+i)+i`
                    =i))IIITTLTLTTTTTTTTTIITTLLTTTII+:i)ii:'
                   +i))IITTTLLLTTTTTTTTTTTTLLLTTTT+:i)))=,
                   =))ITTTTTTTTTTTLTTTTTTLLLLLLTi:=)IIiii;
                  .i)IIITTTTTTTTLTTTITLLLLLLLT);=)I)))))i;
                  :))IIITTTTTLTTTTTTLLHLLLLL);=)II)IIIIi=:
                  :i)IIITTTTTTTTTLLLHLLHLL)+=)II)ITTTI)i=
                  .i)IIITTTTITTLLLHHLLLL);=)II)ITTTTII)i+
                  =i)IIIIIITTLLLLLLHLL=:i)II)TTTTTTIII)i'
                +i)i)))IITTLLLLLLLLT=:i)II)TTTTLTTIII)i;
              +ii)i:)IITTLLTLLLLT=;+i)I)ITTTTLTTTII))i;
             =;)i=:,=)ITTTTLTTI=:i))I)TTTLLLTTTTTII)i;
           +i)ii::,  +)IIITI+:+i)I))TTTTLLTTTTTII))=,
         :=;)i=:,,    ,i++::i))I)ITTTTTTTTTTIIII)=+'
       .+ii)i=::,,   ,,::=i)))iIITTTTTTTTIIIII)=+
      ,==)ii=;:,,,,:::=ii)i)iIIIITIIITIIII))i+:'
     +=:))i==;:::;=iii)+)=  `:i)))IIIII)ii+'
   .+=:))iiiiiiii)))+ii;
  .+=;))iiiiii)));ii+
 .+=i:)))))))=+ii+
.;==i+::::=)i=;
,+==iiiiii+,
    
WELCOME TO PLANET HOPPER\r\n"

    puts "Enter 'S' to Start"

end

def start 
    i = 0
    while i == 0
    input = gets.chomp
    if input.downcase == 's'
        puts "********************\n\n"
        puts "Enter your name..."
        name = gets.chomp
        player = Player.new(name: name, life: 10)
        player.save
        i = 1
    else
        puts "that is not an 'S'"
        puts "Enter 'S' to start"
    end
    end
    player
end

def liftoff(player)
  puts "********************\n\n"
  puts "you are off on an adventure and have enough gas to travel to 3 planets"
  i = 0
  while i == 0
    puts "enter the name of one of the planets below"
    puts "********************\n\n"
    next_3 = Planet.all.sample(3).map { |planet| planet.name}
    puts next_3
    planet = gets.chomp.capitalize
    if !next_3.include?(planet)
      puts "********************\n\n"
      puts "You cannot travel there!!"
    else
      puts "********************\n\n"
      puts "Onward to #{planet}!!!"
      Planet.find_by(name: planet).encounter(player)
      puts "Your business on #{planet} is finished!"
      i = 1
    end
  end
  player
end

def on_planet_choice(planet, player)
  puts "Congrats on safely arriving to #{planet}"
  puts "Do you want to look up the history of this planet or do you want to explore?? Enter 'lookup' or 'explore'"
  explore = gets.chomp
  if explore == "explore"
    Planet.find_by(name: planet).encounter(player)
  elsif explore == "lookup" 
    lookup
  end
  player
end

def explore(player)
end

def lookup
  puts "Let's see what has happened here"
end


def space_navigate(player)
  planets_visited = player.planets
  all_planets_minus_visited = Planet.all.select { |planet| !planets_visited.include?(planet) }
  all_planets_minus_visited.length < 3 ? number_of_planets_to_travel = 1 : number_of_planets_to_travel = rand(2..4)
  can_travel_to = all_planets_minus_visited.sample(number_of_planets_to_travel).map { |planet| planet.name}
  puts "********************\n\n"
  puts "congrats on making it through your last adventure. You can now travel to the #{number_of_planets_to_travel} planets listed below"
  i = 0
  while i == 0
    puts "enter the name of one of the planets below"
    puts "********************\n\n"
    puts can_travel_to
    planet = gets.chomp.capitalize
    if !can_travel_to.include?(planet)
      puts "********************\n\n"
      puts "You cannot travel there!!"
    else
      puts "********************\n\n"
      puts "Onward to #{planet}!!!"
      on_planet_choice(planet, player)
      i = 1
    end
  end
end
