class ArtMedium < ApplicationRecord
  has_many :art_medium_entries, dependent: :destroy
  has_many :art_mediumables, through: :art_medium_entries
  has_many :paintings, through: :art_medium_entries, source: :art_mediumable, source_type: 'Painting'
  has_many :installations, through: :art_medium_entries, source: :art_mediumable, source_type: 'Installation'

  def art_mediumables
    art_medium_entries = self.art_medium_entries # try to get all the art_mediumables through scopes or joins through the database
    art_medium_entries.map {|art_medium| art_medium.art_mediumable} 
  end
end