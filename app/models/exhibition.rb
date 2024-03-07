class Exhibition < ApplicationRecord
  include Taggable
  include PgSearch::Model

  has_many :exhibition_artists, dependent: :destroy
  has_many :artists, through: :exhibition_artists
  
  has_many :gallery_exhibitions, dependent: :destroy
  has_many :galleries, through: :gallery_exhibitions

  has_many :exhibition_art_works, dependent: :destroy
  has_many :art_works, through: :exhibition_art_works
  
  # validates_presence_of :title, :url, :img
  scope :artist, ->(artist) { joins(:artists).where(artists: artist) }
  scope :artist_named, ->(artist_name) { joins(:artists).where(artists: find_artist(artist_name))} # DONE make this fuzzy, see if it can work with misspelled names, or part of a name. May be a gem that supports this. Look at postgres fuzzy searching

  def self.find_artist(artist_name)
    # where('name ILIKE ?', "%#{name}%").first
    Artist.where('dmetaphone(name) = dmetaphone(?)', "#{artist_name}").first
  end
end