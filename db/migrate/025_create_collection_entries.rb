class CreateCollectionEntries < ActiveRecord::Migration[7.1]
    def change
        create_table :collection_entries do |t|
            t.references :collection
            t.references :collectionable, polymorphic: true

            t.timestamps
        end
    end
end