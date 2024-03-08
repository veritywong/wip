class Exhibition < ApplicationRecord
  include Taggable
  include Searchable

  has_many :exhibition_artists, dependent: :destroy
  has_many :artists, through: :exhibition_artists
  
  has_many :gallery_exhibitions, dependent: :destroy
  has_many :galleries, through: :gallery_exhibitions

  has_many :exhibition_art_works, dependent: :destroy
  has_many :art_works, through: :exhibition_art_works
  
  validates_presence_of :title

  scope :artist, ->(artist) { joins(:artists).where(artists: artist) }
  scope :has_artist, ->(artist_name) { joins(:artists).where(artists: find_artist_by_name(artist_name))} 

end