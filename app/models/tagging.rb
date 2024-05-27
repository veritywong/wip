class Tagging < ApplicationRecord
    belongs_to :taggable, polymorphic: true
    belongs_to :tag

    scope :by_tag_name, ->(tag_name) { joins(:tag).where('name ILIKE?', "%#{tag_name}%") }
    scope :by_tag_names, ->(tag_name_one, tag_name_two) { joins(:tag).where('tags.name ILIKE? OR tags.name ILIKE?', "%#{tag_name_one}%", "%#{tag_name_two}%") }

    def self.find_tagged # is this necessary?
        all_tagged = []
        self.pluck(:taggable_type).uniq.each {|type| all_tagged << type.constantize.tagged}
        all_tagged
    end

end