class Tag < ApplicationRecord
    has_many :taggings, dependent: :destroy
    has_many :taggable, through: :taggings
    has_many :art_works, through: :taggings, source: :taggable, source_type: 'ArtWork'
    has_many :artists, through: :taggings, source: :taggable, source_type: 'Artist'

    def self.find_tagged
        all_tagged = []
        Tagging.pluck(:taggable_type).uniq.each {|type| all_tagged << type.constantize.tagged}
        all_tagged
    end

    # add a method to find an object with multiple tags?
end