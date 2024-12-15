# WIP
Art app for recording arty things

+ exhibition events
+ arty days out
+ inspo images
+ projects
+ current exhibitions feed

![Alt text](app/assets/images/wip_data_structure_v1.png "WIP og data structure")

## Process
This app has been a learning activity for me to first of all get a better understanding of rails and programming in general. I started by focussing on the data structure, in order to better understand concepts such as polymorphism. It also has been a way for me to practice using the console to become more fluent and speedy with programming.

## Changes
### Exhibitions
I originally had the idea that an exhibition could be a touring exhibition, so it could have many galleries, however I changed my mind so that now an exhibition belongs to a gallery. If I have a touring exhibition I still need to decide how I would like this piece of informatino to be stored.
I have also re-named exhibitions to events to broaden the definition of an exhibition - which is ultimately an art event. I also intend for events to also cover art day outs, such as a walk where one might take inspo pics and sketches on the journey.

### Visits
I had the model visits as it's own model to record a visit to a gallery and any other arty events a user might do. However now I have updated exhibitions to events this was no longer needed.

### Gallery
I have updated this now to be location to better encompass the broader nature of the record that it will be keeping.



---------------------------------------------------------------------------
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


