class Opportunity < ApplicationRecord
    belongs_to :city
    belongs_to :organisation, optional: true
    # validates_presence_of :name, :website, :application_open_at, :application_deadline_at
    
    # organisation, date, location, website 
    # commences_at ?
    # outcome ?
end
