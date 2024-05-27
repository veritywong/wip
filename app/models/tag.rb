class Tag < ApplicationRecord
    include Searchable

    has_many :taggings, dependent: :destroy
    has_many :taggables, through: :taggings
    has_many :art_works, through: :taggings, source: :taggable, source_type: 'ArtWork' # do I want these?
    has_many :artists, through: :taggings, source: :taggable, source_type: 'Artist'

    # add a method to find an object with multiple tags?
    # 1. tag selected, find all with this tag
    # 2. tag_two selected, final all with first and second tag. How to do this? Create an array where all
    
    def taggables
      taggings = Tagging.where(tag: self)  # or self.taggings # same as art_mediumables see if you can make it more lightweight
      taggings.map {|tagging| tagging.taggable }
    end
    
    def self.find_with_tags(tags)
      array_with_tags = tags.map {|tag| tag.taggables }
      # occurrences = array_with_tags.group_by {|element| element}
      # repeated = occurrences.select {|key, value| value.length > 1} - not working, each value is unique even if it's 'not'...
      # repeated

      # two tags that share a parent id 
      # https://stackoverflow.com/questions/49771944/rails-find-records-tagged-with-multiple-tags-undefined-method-where-for-arra
      # having, works with group
    end
end