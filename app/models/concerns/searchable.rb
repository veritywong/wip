module Searchable
    extend ActiveSupport::Concern

    included do
    end

    class_methods do
        include PgSearch::Model

        def fuzzy_search(attribute, search_item)
            self.where("dmetaphone(#{attribute}) = dmetaphone(?)", "#{search_item}").first
        end
    end
end