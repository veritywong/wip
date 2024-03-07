class AddStyleToInstallations < ActiveRecord::Migration[7.1]
    def change
        add_column :installations, :style, :string
    end
end