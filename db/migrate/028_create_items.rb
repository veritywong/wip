class CreateItems < ActiveRecord::Migration[7.1]
    def change
        create_table :items do |t|
            t.integer :collection_id
            t.text :content

            t.timestamps
        end
    end
end