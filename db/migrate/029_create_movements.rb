class CreateMovements < ActiveRecord::Migration[7.1]
    create_table :movements do |t|
        t.string :name
        t.string :description
        t.string :period

        t.timestamps
    end
end