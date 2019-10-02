class AddChampionToPlanets < ActiveRecord::Migration[5.2]
    def change
        add_column :planets, :champion, :string
    end
end