class ArtWork < ApplicationRecord
    belongs_to :artist
    belongs_to :art, polymorphic: true

    has_many :taggings, as: :taggable
    has_many :tags, through: :taggings

    def tag_names
        tags.pluck(:name)
    end

    def tag(name)
        tag = Tag.find_or_create_by(name: name)
        Tagging.create(tag: tag, taggable: self)
    end
end