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

        def artist_tag_names # finds all artist tags including those for art works
            if self.is_a?(Artist)
                tags = []
                self.art_works.each {|art_work| tags << art_work.tag_names if art_work.tags.any?}
                tags << self.tag_names if self.tag_names.any?
                tags.flatten
            end
        end
    
        def add_tag(name)
            tags << Tag.find_or_create_by(name: name) # make this fuzzy?'' --> done below
            # existing_tag = Tag.fuzzy_search(:name, name)
            # if existing_tag
            #     tags << existing_tag
            # else
            #     tags << Tag.create(name: name)
            # end
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