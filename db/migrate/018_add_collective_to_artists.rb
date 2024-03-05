class AddCollectiveToArtists < ActiveRecord::Migration[7.1]
    def change
        add_column :artists, :collective, :boolean, default: false
    end
end