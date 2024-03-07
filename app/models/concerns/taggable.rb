module Taggable
    extend ActiveSupport::Concern

    included do
        has_many :taggings, as: :taggable
        has_many :tags, through: :taggings

        def is_tagged?
            tags.present? # .any? more appropriate than .present?, which is slower as it's instantiating all of the things. Could make this a que
        end

        def tag_names
            tags.pluck(:name)
        end
    
        def add_tag(name)
            tags << Tag.find_or_create_by(name: name)
        end

    end

    class_methods do
        def select_all_tagged
            all.select {|item| item.is_tagged?} # loads all into memory, lots of work where.not(nil), replace with database method (make a scope)
        end

        def find_all_with_tag(tag)
            joins(:tags).where(tags: tag)
        end

    end
end