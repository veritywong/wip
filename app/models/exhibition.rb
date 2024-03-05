class Exhibition < ApplicationRecord
  include Taggable

  has_many :exhibition_artists, dependent: :destroy
  has_many :artists, through: :exhibition_artists
  
  has_many :gallery_exhibitions, dependent: :destroy
  has_many :galleries, through: :gallery_exhibitions

  has_many :exhibition_art_works, dependent: :destroy
  has_many :art_works, through: :exhibition_art_works
  
  # validates_presence_of :title, :url, :img
end