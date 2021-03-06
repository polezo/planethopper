require_relative "../config/environment"
$prompt = TTY::Prompt.new


def welcome
    puts ColorizedString["                                                                   ..;===+.
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
    
"].colorize(:color => :magenta)+
ColorizedString["
--                                                                                                                                       
--   _ _ _ _____ __    _____ _____ _____ _____    _____ _____    _____ __    _____ _____ _____ _____ _____ _____ _____ _____ _____ _____ 
--  | | | |   __|  |  |     |     |     |   __|  |_   _|     |  |  _  |  |  |  _  |   | |   __|_   _|  |  |     |  _  |  _  |   __| __  |
--  | | | |   __|  |__|   --|  |  | | | |   __|    | | |  |  |  |   __|  |__|     | | | |   __| | | |     |  |  |   __|   __|   __|    -|
--  |_____|_____|_____|_____|_____|_|_|_|_____|    |_| |_____|  |__|  |_____|__|__|_|___|_____| |_| |__|__|_____|__|  |__|  |_____|__|__|
--                                                                                                                                       
\r\n"].colorize(:cyan)

    puts "Enter 'S' to Start"

end

def password_check
  new_line
  rocket = $prompt.decorate('🚀')
  password_check = $prompt.mask("To ensure you are not an imposter, what is your password?", mask: rocket)
end

def start 
    while true
    input = gets.chomp
    if input.downcase == 's'
        new_line
        puts "Enter your name..."
        name = gets.chomp
        if name == ''
          puts "You have to enter something in the name!!!"
          break
        end
        if Player.find_by(name: name) ##if a player with the same name exists in DB
          new_line
          new_or_same = $prompt.select("#{name} has already been here! Are you #{name} or are you a new player?", ["New", "Returning"])
          if new_or_same == 'New' ##Asks player if they are new, returns true if they say yes
            new_name = "#{name}" + "#{rand(1..3000)}"
            new_line
            puts "Since that name has been taken, you will be called #{new_name}"  ##will create player with appended name
            gets
            player = Player.create(name: new_name, life: 10, dollars: 8)
            Weapon.base_weapons(player)
            player.set_password
            break
          else
            if password_check == Player.find_by(name: name).password ##if they provide
              player = Player.find_by(name: name) ##correct password will not create new player
              Weapon.base_weapons(player)
              break         ## but let them continue as themselves
            else
              puts "Imposter, begone from here!"
              break
            end
          end
        end
        player = Player.create(name: name, life: 10, dollars:8)
        Weapon.base_weapons(player)
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
  puts ColorizedString["**************************************************\n\n"].colorize(:magenta)
end

def planets_available_to_player(player)
  planets_visited = player.planets
  
  all_planets_minus_visited = Planet.all.select { |planet| !planets_visited.include?(planet) }
  all_planets_minus_visited.count < 3 ? number_of_planets_to_travel = 1 : number_of_planets_to_travel = rand(2..4)
  can_travel_to = all_planets_minus_visited.sample(number_of_planets_to_travel).map { |planet| planet.name}
  travel_planet = $prompt.select("Which planet will you travel to now?", can_travel_to.delete_if do |planet| 
    if player.planets.all.first
    planet == player.planets.all.first.name 
    end
  end
  )
  travel_planet
end

def rocket
    puts"    
        !
        !
        ^
       / \\
      /___\\
     |=   =|
     | P H |
     | L O |
     | A P |
     | N P |
     | E E |
     | T R |
     |     |
     |     |
     |     |
    /|##!##|\\
   / |##!##| \\
  /  |##!##|  \\
 |  / ^ | ^ \\  |
 | /  ( | )  \\ |
 |/   ( | )   \\|"+
 ColorizedString["
     ((   ))
    ((  :  ))
    ((  :  ))
     ((   ))
      (( ))
       ( )
        .
        .
     "].colorize(:light_red)
end