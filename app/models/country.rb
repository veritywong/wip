class Country < ApplicationRecord
    has_many :cities, dependent: :destroy

    # validates_presence_of :name, :country_code
    # validates_uniqueness_of :country_code

end