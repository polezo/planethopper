class AddCreatorToPlanets < ActiveRecord::Migration[5.2]
    def change
        add_column :planets, :creator, :string
    end
end