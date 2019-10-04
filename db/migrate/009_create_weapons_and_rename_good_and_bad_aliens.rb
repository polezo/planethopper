class CreateWeaponsAndRenameGoodAndBadAliens < ActiveRecord::Migration[5.2]
    def change
      create_table :weapons do |t|
        t.string :name
        t.integer :damage_level
        t.boolean :dangerous?
        t.string :player_id
      end
    end
  end