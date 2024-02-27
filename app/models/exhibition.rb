class Exhibition < ApplicationRecord
  has_many :exhibition_artists
  has_many :artists, through: :exhibition_artists
  
  has_many :gallery_exhibitions
  has_many :galleries, through: :gallery_exhibitions
  
  # validates_presence_of :title, :url, :img
end