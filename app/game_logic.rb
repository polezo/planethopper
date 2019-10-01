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
    while true
    input = gets.chomp
    if input.downcase == 's'
        new_line
        puts "Enter your name..."
        name = gets.chomp
        player = Player.new(name: name, life: 100)
        player.save
        break
    else
        puts "that is not an 'S'"
        puts "Enter 'S' to start"
    end
    end
    player
end

def new_line
  puts "********************\n\n"
end

def planets_available_to_player(player)
  planets_visited = player.planets
  all_planets_minus_visited = Planet.all.select { |planet| !planets_visited.include?(planet) }
  all_planets_minus_visited.length < 3 ? number_of_planets_to_travel = 1 : number_of_planets_to_travel = rand(2..4)
  can_travel_to = all_planets_minus_visited.sample(number_of_planets_to_travel).map { |planet| planet.name.downcase }
  can_travel_to.each {|planet| puts planet.split.map(&:capitalize).join(" ")}
  planet = gets.chomp.downcase
  while !can_travel_to.include?(planet)
    puts "You cannot travel there! Select one of the given planets!"
    can_travel_to.each {|planet| puts planet.split.map(&:capitalize).join(" ")}
    planet = gets.chomp.downcase
  end
    planet.capitalize
end