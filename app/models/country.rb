class Country < ApplicationRecord
    has_many :cities

    # validates_presence_of :name, :country_code
    # validates_uniqueness_of :country_code

end