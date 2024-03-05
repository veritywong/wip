class Tagging < ApplicationRecord
    belongs_to :taggable, polymorphic: true
    belongs_to :tag

    def taggable
        taggable_type.constantize.find_by(id: taggable_id)
    end
end