class Tag < ApplicationRecord
    has_many :taggings
    has_many :taggable, through: :taggings
end