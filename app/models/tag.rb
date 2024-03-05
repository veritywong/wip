class Tag < ApplicationRecord
    has_many :taggings, dependent: :destroy
    has_many :taggable, through: :taggings
end