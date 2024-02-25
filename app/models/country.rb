class CountryBase < ApplicationRecord
    belongs_to :placeable, polymorphic: true
    
    validates_presence_of :name, :country_code, :city
    validates_uniqueness_of :country_code

end