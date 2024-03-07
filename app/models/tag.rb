class Tag < ApplicationRecord
    has_many :taggings, dependent: :destroy
    has_many :taggable, through: :taggings

    def find_tagged
        taggings.each do |tagging| 
            if tagging.taggable_type == 'ArtWork' # string checks are expensive, tagging.is_a, tag.taggings.first.taggable.is_a?(ArtWork), class check better
                puts "#{self.name} - #{tagging.taggable.art.title} - #{tagging.taggable.artist.name}"
            end
            if tagging.taggable_type == 'Exhibition'
                puts "#{self.name} - #{tagging.taggable.title}"
            end
        end
    end

    # add a method to find an object with multiple tags?
    # make adding a tag fuzzy

end