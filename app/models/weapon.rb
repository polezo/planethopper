

class Weapon < ActiveRecord::Base
    belongs_to :player

    $prompt = TTY::Prompt.new
    
    
    def self.base_weapons(player)
        Weapon.find_or_create_by(name: "Laser lv 1", damage_level: 2, dangerous?: false, player_id: player.id)
        Weapon.find_or_create_by(name: "Fist", damage_level: 1, dangerous?: false, player_id: player.id)
        
    end

    def self.weapons_array
        ["Laser lv 2","Space Revolver","Laser Crossbow","Acme Mega Laser","Flame Thrower","Acme Knife Gun","Master Laser","Acme ExtraMega Lazer","Gravity Beam","Acme Grenade Launcher","Rocket Launcher","Acme Lightsaber Shooter"]
    end

    def self.generate_weapon_for_store(weapon_string)

        case weapon_string
        when "Laser lv 2"
            Weapon.new(name: "Laser lv 2", damage_level: 3, dangerous?: false)
        when "Space Revolver"
            Weapon.new(name: "Space Revolver", damage_level: 3, dangerous?: false)
        when "Laser Crossbow"
            Weapon.new(name: "Laser Crossbow", damage_level: 3, dangerous?: false)
        when "Acme Mega Laser"
            Weapon.new(name: "Acme Mega Laser", damage_level: 4, dangerous?: true)  
        when "Flame Thrower"
            Weapon.new(name: "Flame Thrower", damage_level: 4, dangerous?: false)
        when "Acme Knife Gun"
            Weapon.new(name: "Acme Knife Gun", damage_level: 4, dangerous?: true)
        when "Master Laser"
            Weapon.new(name: "Master Laser", damage_level: 5, dangerous?: false)
        when "Acme ExtraMega Lazer"
            Weapon.new(name: "Acme ExtraMega Lazer", damage_level: 5, dangerous?: true)
        when "Gravity Beam" 
            Weapon.new(name: "Gravity Beam", damage_level: 5, dangerous?: false)
        when "Acme Grenade Launcher"
            Weapon.new(name: "Acme Grenade Launcher", damage_level: 6, dangerous?: true)
        when "Rocket Launcher"
            Weapon.new(name: "Rocket Launcher", damage_level: 6, dangerous?: false)
        when "Acme Lightsaber Shooter"
            Weapon.new(name: "Acme Lightsaber Shooter", damage_level: 6, dangerous?: true)
        end
    end

    def self.generate_weapon(weapon_string,player=nil)

        case weapon_string
        when "Laser lv 2"
            Weapon.find_or_create_by(name: "Laser lv 2", damage_level: 3, dangerous?: false, player_id: player.id)
        when "Space Revolver"
            Weapon.find_or_create_by(name: "Space Revolver", damage_level: 3, dangerous?: false, player_id: player.id)
        when "Laser Crossbow"
            Weapon.find_or_create_by(name: "Laser Crossbow", damage_level: 3, dangerous?: false, player_id: player.id)
        when "Acme Mega Laser"
            Weapon.find_or_create_by(name: "Acme Mega Laser", damage_level: 4, dangerous?: true, player_id: player.id)  
        when "Flame Thrower"
            Weapon.find_or_create_by(name: "Flame Thrower", damage_level: 4, dangerous?: false, player_id: player.id)
        when "Acme Knife Gun"
            Weapon.find_or_create_by(name: "Acme Knife Gun", damage_level: 4, dangerous?: true, player_id: player.id)
        when "Master Laser"
            Weapon.find_or_create_by(name: "Master Laser", damage_level: 5, dangerous?: false, player_id: player.id)
        when "Acme ExtraMega Lazer"
            Weapon.find_or_create_by(name: "Acme ExtraMega Lazer", damage_level: 5, dangerous?: true, player_id: player.id)
        when "Gravity Beam" 
            Weapon.find_or_create_by(name: "Gravity Beam", damage_level: 5, dangerous?: false, player_id: player.id)
        when "Acme Grenade Launcher"
            Weapon.find_or_create_by(name: "Acme Grenade Launcher", damage_level: 6, dangerous?: true, player_id: player.id)
        when "Rocket Launcher"
            Weapon.find_or_create_by(name: "Rocket Launcher", damage_level: 6, dangerous?: false, player_id: player.id)
        when "Acme Lightsaber Shooter"
            Weapon.find_or_create_by(name: "Acme Lightsaber Shooter", damage_level: 6, dangerous?: true, player_id: player.id)
        end
    end


    def self.store(player)
        case player.level_check
        when (0..3)
        selection = self.weapons_array[0..3].sample(3)
        when (4..5)
        selection = self.weapons_array[4..7].sample(3)
        else
        selection = self.weapons_array[8..11].sample(3)
        end

        #this code is hideous someone help meeeeee
        
    
        price1 = Weapon.generate_weapon_for_store(selection[0]).damage_level*3-rand(1-3)
        price2 = Weapon.generate_weapon_for_store(selection[1]).damage_level*3-rand(1-3)
        price3 = Weapon.generate_weapon_for_store(selection[2]).damage_level*3-rand(1-3)

        selection_with_prices = []

        selection_with_prices << selection[0] + ".....$#{price1}"
        selection_with_prices << selection[1] + ".....$#{price2}"
        selection_with_prices << selection[2] + ".....$#{price3}"


        # selection_with_prices = selection.each { |weapon| weapon + ".....$#{price}" }
        
        selection_with_prices << "exit"
        while true
        purchase_or_exit = $prompt.select("You have #{player.dollars} dollars, whaddya buyin?", selection_with_prices)
        if purchase_or_exit == "exit"
            new_line
            break
        elsif
            selection_with_prices.index(purchase_or_exit) == 0 && player.dollars >= price1
        gun1 = Weapon.generate_weapon(selection[0],player)
        
        player.dollars -= price1
        
        new_line
        puts ColorizedString["You are the proud owner of a new #{selection[0]}!!!"].colorize(:yellow)
            break
        elsif
            selection_with_prices.index(purchase_or_exit) == 1 && player.dollars >= price2
        gun2 = Weapon.generate_weapon(selection[1],player)
       
        player.dollars -= price2
        
        new_line
        puts ColorizedString["You are the proud owner of a new #{selection[1]}!!!"].colorize(:yellow)
        new_line
            break
        elsif
            selection_with_prices.index(purchase_or_exit) == 2 && player.dollars >= price3
        gun3 = Weapon.generate_weapon(selection[2],player)
        
        player.dollars -= price3
       
        
        new_line
            puts ColorizedString["You are the proud owner of a new #{selection[2]}!!!"].colorize(:yellow)
            break
        else
            new_line
            puts ColorizedString["You don't have enough money for that!!"].colorize(:light_red)
        end

    end

end
end
