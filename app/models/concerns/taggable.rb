module Taggable
    extend ActiveSupport::Concern

    included do
        has_many :taggings, as: :taggable
        has_many :tags, through: :taggings

        def is_tagged?
            tags.any? 
        end

        def tag_names
            tags.pluck(:name)
        end
    
        def add_tag(name)
            tags << Tag.find_or_create_by(name: name) # make this fuzzy?
        end
    end

    class_methods do
        def tagged 
            joins(:tags).where('taggings.taggable_type' => self.to_s).uniq
        end

        def find_all_with_tag(tag)
            joins(:tags).where(tags: tag)
        end
    end
end