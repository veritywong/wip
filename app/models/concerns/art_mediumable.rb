module ArtMediumable
    extend ActiveSupport::Concern

    included do
        has_many :art_medium_entries, as: :art_mediumable
        has_many :art_media, through: :art_medium_entries

        def has_medium?
            art_media.any? 
        end

        def art_media_names
            art_media.pluck(:name)
        end
    
        def add_medium(name)
            art_media << ArtMedium.find_or_create_by(name: name) # make this fuzzy?
        end
    end

    class_methods do
        def has_art_media
            joins(:art_media).where('art_medium_entries.art_mediumable_type' => self.to_s).uniq
        end

        def find_with_medium(art_medium)
            joins(:art_media).where(art_media: art_medium)
        end
    end
end