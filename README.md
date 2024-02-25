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


"//img.artrabbit.com/events/yayoi-kusama-infinity-mirror-rooms/images/9Wqy2SlupKur/350x233/kusa714-infinity-mirrored-room-filled-with-the-brilliance-of-life-2011-a.jpg 350w, //img.artrabbit.com/events/yayoi-kusama-infinity-mirror-rooms/images/HTOLNE0gzFEa/420x280/kusa714-infinity-mirrored-room-filled-with-the-brilliance-of-life-2011-a.jpg 420w,//img.artrabbit.com/events/yayoi-kusama-infinity-mirror-rooms/images/E2y2rMdxR2U5/680x453/kusa714-infinity-mirrored-room-filled-with-the-brilliance-of-life-2011-a.jpg 680w,//img.artrabbit.com/events/yayoi-kusama-infinity-mirror-rooms/images/zowp5Kiiu5Jr/994x662/kusa714-infinity-mirrored-room-filled-with-the-brilliance-of-life-2011-a.jpg 994w,//img.artrabbit.com/events/yayoi-kusama-infinity-mirror-rooms/images/rP9EQegy300U/1120x746/kusa714-infinity-mirrored-room-filled-with-the-brilliance-of-life-2011-a.jpg 1120w"

.gsub(/.*\/\/([^ ]*).*/, '\1') # selected the last section after //

gsub(/(\s+).*/, '')