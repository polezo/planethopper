class AddScenariosToPlanets < ActiveRecord::Migration[5.2]
    def change
        add_column :planets, :bad_scenario, :string
        add_column :planets, :good_scenario, :string
    end
end