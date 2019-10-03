class CreateWeapons < ActiveRecord::Migration[5.2]
    def change
      create_table :weapons do |t|
        t.string :name
        t.integer :damage_low
        t.integer :damage_high
        t.boolean :dangerous?
      end
    end
  end