class CreateOpportunities < ActiveRecord::Migration[7.1]
    def change
        create_table :opportunities do |t|
            t.integer :city_id
            t.integer :organisation_id
            t.string :name
            t.text :description
            t.string :type, null: false
            t.string :website
            t.datetime :application_opens_at
            t.datetime :application_closes_at
            t.boolean :free
            t.boolean :funded
    
        end
    end
end