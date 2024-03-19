# README

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
<%= render partial: 'shared/image_upload_form', locals: { model: @exhibition } %>
  <%#= render partial: "shared/document_uploader", locals: { uploader_name: "candidate_cv", uploader_title: "Candidate Resume" } %>

https://medium.com/nerd-for-tech/getting-started-with-cloudinary-in-ruby-on-rails-6-925888032395