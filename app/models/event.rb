class Event < ApplicationRecord
  include Taggable
  include Searchable
  include Attachable

  belongs_to :location, optional: true

  has_many :event_artists, dependent: :destroy
  has_many :artists, through: :event_artists#, inverse_of: :events

  has_many :event_art_works, dependent: :destroy
  has_many :art_works, through: :event_art_works

  has_one_attached :promo_image
  has_many_attached :pdfs

  accepts_nested_attributes_for :event_artists
  accepts_nested_attributes_for :artists, allow_destroy: true

  validates_presence_of :title

  scope :artist, ->(artist) { joins(:artists).where(artists: artist) }
  scope :has_artist, ->(artist_name) { joins(:artists).where(artists: Artist.fuzzy_search(:name, artist_name))} 


  has_many :collection_entries, as: :collectionable
  # has_many_attached :images, dependent: :purge_later
  has_many_attached :images do |attachable|
      attachable.variant :thumb, resize_to_limit: [100, 100]
  end
end