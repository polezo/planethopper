class AddDollarsToPlayer < ActiveRecord::Migration[5.2]
    def change
      add_column :players, :dollars, :integer
      end
    end
  