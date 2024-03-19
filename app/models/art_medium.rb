class ArtMedium < ApplicationRecord
  has_many :art_medium_entries, dependent: :destroy
  has_many :art_mediumables, through: :art_medium_entries
  has_many :paintings, through: :art_medium_entries, source: :art_mediumable, source_type: 'Painting'
  has_many :installations, through: :art_medium_entries, source: :art_mediumable, source_type: 'Installation'

  def self.all_with_media
    all_with_media = []
    ArtMediumEntry.pluck(:art_mediumable_type).uniq.each {|type| all_with_media << type.constantize.has_art_media}
    all_with_media
  end

  def find_all_types_with_medium
    all_with_media = []
    ArtMediumEntry.pluck(:art_mediumable_type).uniq.each {|type| all_with_media << type.constantize.find_all_with_medium(self)}
    all_with_media
  end
end