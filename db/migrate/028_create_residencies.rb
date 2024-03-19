class CreateResidencies < ActiveRecord::Migration[7.1]
    def change
        create_table :residencies do |t|
            t.integer :city_id
            t.integer :organisation_id
            t.string :name
            t.string :website
            t.datetime :application_open_at
            t.datetime :application_deadline_at
    
        end
    end
end