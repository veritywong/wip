class Tag < ApplicationRecord
    has_many :taggings, dependent: :destroy
    has_many :taggable, through: :taggings

    def find_tagged
        taggings.each do |tagging| 
            if tagging.taggable_type == 'ArtWork'
                puts "#{self.name} - #{tagging.taggable.art.title} - #{tagging.taggable.artist.name}"
            end
        end
    end

end