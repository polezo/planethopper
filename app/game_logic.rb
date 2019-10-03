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
    




--                                                                                                                                       
--   _ _ _ _____ __    _____ _____ _____ _____    _____ _____    _____ __    _____ _____ _____ _____ _____ _____ _____ _____ _____ _____ 
--  | | | |   __|  |  |     |     |     |   __|  |_   _|     |  |  _  |  |  |  _  |   | |   __|_   _|  |  |     |  _  |  _  |   __| __  |
--  | | | |   __|  |__|   --|  |  | | | |   __|    | | |  |  |  |   __|  |__|     | | | |   __| | | |     |  |  |   __|   __|   __|    -|
--  |_____|_____|_____|_____|_____|_|_|_|_____|    |_| |_____|  |__|  |_____|__|__|_|___|_____| |_| |__|__|_____|__|  |__|  |_____|__|__|
--                                                                                                                                       
\r\n"

    puts "Enter 'S' to Start"

end

def password_check
  puts "To ensure you are not an imposter, what is your password?"
  password = gets.chomp
end

def start 
    while true
    input = gets.chomp
    if input.downcase == 's'
        new_line
        puts "Enter your name..."
        name = gets.chomp
        if Player.find_by(name: name) ##if a player with the same name exists in DB
          if Player.check_if_new_player(name) ##Asks player if they are new, returns true if they say yes
            new_name = "#{name}" + "#{rand(1..3000)}"
            puts "You will be called #{new_name}"  ##will create player with appended name
            player = Player.create(name: new_name, life: 10)
            player.set_password
            break
          else
            if password_check == Player.find_by(name: name).password ##if they provide
              player = Player.find_by(name: name) ##correct password will not create new player
              break         ## but let them continue as themselves
            else
              puts "Imposter, begone from here!"
              break
            end
          end
        end
        player = Player.create(name: name, life: 10)
        player.set_password
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