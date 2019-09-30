class CreateLandings < ActiveRecord::Migration[5.2]
    def change
        create_table :landings do |t|
            t.integer :planet_id
            t.integer :player_id
        end
    end
end