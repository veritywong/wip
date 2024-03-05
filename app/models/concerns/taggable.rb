module Taggable
    extend ActiveSupport::Concern

    included do
        has_many :taggings, as: :taggable
        has_many :tags, through: :taggings

        def is_tagged?
            tags.present?
        end

        def tag_names
            tags.pluck(:name)
        end
    
        def tag(name)
            self.tags << Tag.find_or_create_by(name: name)
        end
    end

    class_methods do
        def select_all_tagged
            all.select {|item| item.is_tagged?}
        end
    end
end