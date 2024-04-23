# WIP

Art inspiration app - visual diary and planner to store everything related to your art practice.
A place to remind yourself what inspires you, what you want to do and what you've done.

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
Exhibition model
belongs to gallery
has many artists
- title
- start date
- end date
- gallery_id


Gallery
has many exhibitions
has many artists
has many opening hours
- location
- name


Artist
belongs to gallery
belongs to exhibitions
- name
- description

OpeningHours
- monday
- tuesday
- wednesday
- thursday
-friday
- saturday

#exhibition has exhibition_artists, artists are polymorphic 'painter x', 'scultor y', create an artist-type e.g. Musician, Author, Writer

Image upload - should I use cloudinary?

https://medium.com/nerd-for-tech/getting-started-with-cloudinary-in-ruby-on-rails-6-925888032395