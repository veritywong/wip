class Exhibition < ApplicationRecord
  include Taggable
  include Searchable
  include Attachable

  has_many :exhibition_artists, dependent: :destroy
  has_many :artists, through: :exhibition_artists#, inverse_of: :exhibitions
  
  has_many :gallery_exhibitions, dependent: :destroy
  has_many :galleries, through: :gallery_exhibitions

  has_many :exhibition_art_works, dependent: :destroy
  has_many :art_works, through: :exhibition_art_works

  has_one_attached :promo_image
  has_many_attached :pdfs

  accepts_nested_attributes_for :gallery_exhibitions
  accepts_nested_attributes_for :galleries
  accepts_nested_attributes_for :exhibition_artists
  accepts_nested_attributes_for :artists

  validates_presence_of :title

  scope :artist, ->(artist) { joins(:artists).where(artists: artist) }
  scope :has_artist, ->(artist_name) { joins(:artists).where(artists: Artist.fuzzy_search(:name, artist_name))} 

end