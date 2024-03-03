class Exhibition < ApplicationRecord
  has_many :exhibition_artists
  has_many :artists, through: :exhibition_artists
  
  has_many :gallery_exhibitions
  has_many :galleries, through: :gallery_exhibitions

  has_many :exhibition_art_works
  has_many :art_works, through: :exhibition_art_works
  
  # validates_presence_of :title, :url, :img
end