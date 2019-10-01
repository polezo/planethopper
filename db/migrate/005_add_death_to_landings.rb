class AddDeathToLandings < ActiveRecord::Migration[5.2]
    def change
        add_column :landings, :died, :boolean
    end
end