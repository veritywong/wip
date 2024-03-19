class CreateCollectionEvents < ActiveRecord::Migration[7.1]
    def change
        create_table :collection_events do |t|
            t.integer :collection_id
            t.integer :event_id
    
            t.timestamps
        end
    end
end