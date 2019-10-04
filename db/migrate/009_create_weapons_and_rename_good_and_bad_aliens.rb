class CreateWeaponsAndRenameGoodAndBadAliens < ActiveRecord::Migration[5.2]
    def change
      create_table :weapons do |t|
        t.string :name
        t.integer :damage_level
        t.boolean :dangerous?

        rename_column :planets, :good_scenario, :good_alien
        rename_column :planets, :bad_scenario, :bad_alien

      end
    end
  end