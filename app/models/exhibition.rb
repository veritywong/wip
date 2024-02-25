class Exhibition < ApplicationRecord
  has_many :countries, as: :placeable
  has_many :artists, as: :creatives
  
  has_many :gallery_exhibitions
  has_many :galleries, through: :gallery_exhibitions
  
  has_many :exhibition_artists
  has_many :artists, through: :exhibition_artists

  validates_presence_of :title, :gallery_name, :url, :start_date, :end_date
end