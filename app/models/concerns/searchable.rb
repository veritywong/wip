module Searchable
    extend ActiveSupport::Concern

    included do
    end

    class_methods do
        include PgSearch::Model

        def fuzzy_search(attribute, item)
            self.where("dmetaphone(#{attribute}) = dmetaphone(?)", "#{item}").first
        end
    end
end