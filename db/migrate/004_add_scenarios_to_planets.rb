class AddScenariosToPlanets < ActiveRecord::Migration[5.2]
    def change
        add_column :planets, :bad_alien, :string
        add_column :planets, :good_alien, :string
    end
end