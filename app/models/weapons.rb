class Weapon < ActiveRecord::Base
    belongs_to :player


    def self.base_weapons(player)
        Weapon.find_or_create_by(name: "Laser lv 1", damage_level: 2, dangerous?: false, player_id: player.id)
        Weapon.find_or_create_by(name: "Fist", damage_level: 1, dangerous?: false, player_id: player.id)
        
    end

    def weapons_array
        ["Laser lv 2","Space Revolver","Laser Crossbow","Acme Mega Laser","Flame Thrower","Acme Knife Gun","Master Laser","Acme ExtraMega Lazer","Gravity Beam","Acme Grenade Launcher","Acme Grenade Launcher","Rocket Launcher","Acme Lightsaber Shooter"]
    end

    def generate_weapon(weapon_string,player=nil)

        case weapon_string
        when "Laser lv 2"
            Weapon.find_or_create_by(name: "Laser lv 2", damage_level: 3, dangerous?: false, player_id = player.id)
        when "Space Revolver"
            Weapon.find_or_create_by(name: "Space Revolver", damage_level: 3, dangerous?: false, player_id = player.id)
        when "Laser Crossbow"
            Weapon.find_or_create_by(name: "Laser Crossbow", damage_level: 3, dangerous?: false, player_id = player.id)
        when "Acme Mega Laser"
            Weapon.find_or_create_by(name: "Acme Mega Laser", damage_level: 4, dangerous?: true), player_id = player.id)  
        when "Flame Thrower"
            Weapon.find_or_create_by(name: "Flame Thrower", damage_level: 4, dangerous?: false, player_id = player.id)
        when "Acme Knife Gun"
            Weapon.find_or_create_by(name: "Acme Knife Gun", damage_level: 4, dangerous?: false, player_id = player.id)
        when "Master Laser"
            Weapon.find_or_create_by(name: "Master Laser", damage_level: 5, dangerous?: false, player_id = player.id)
        when "Acme ExtraMega Lazer",
            Weapon.find_or_create_by(name: "Acme ExtraMega Lazer", damage_level: 5, dangerous?: true, player_id = player.id)
        when "Gravity Beam" 
            Weapon.find_or_create_by(name: "Gravity Beam", damage_level: 5, dangerous?: true, player_id = player.id)
        when "Acme Grenade Launcher"
            Weapon.find_or_create_by(name: "Acme Grenade Launcher", damage_level: 6, dangerous?: true, player_id = player.id)
        when "Rocket Launcher"
            Weapon.find_or_create_by(name: "Rocket Launcher", damage_level: 6, dangerous?: false, player_id = player.id)
        when "Acme Lightsaber Shooter"
            Weapon.find_or_create_by(name: "Acme Lightsaber Shooter", damage_level: 6, dangerous?: true, player_id = player.id)
        end
    end



end
