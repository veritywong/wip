# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 28) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "fuzzystrmatch"
  enable_extension "pg_trgm"
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "activities", force: :cascade do |t|
    t.integer "gallery_exhibition_id"
    t.string "name"
    t.text "note"
    t.datetime "scheduled_at"
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "art_media", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "art_medium_entries", force: :cascade do |t|
    t.bigint "art_medium_id"
    t.string "art_mediumable_type"
    t.bigint "art_mediumable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["art_medium_id"], name: "index_art_medium_entries_on_art_medium_id"
    t.index ["art_mediumable_type", "art_mediumable_id"], name: "index_art_medium_entries_on_art_mediumable"
  end

  create_table "art_works", force: :cascade do |t|
    t.bigint "artist_id"
    t.string "art_type"
    t.bigint "art_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["art_type", "art_id"], name: "index_art_works_on_art"
    t.index ["artist_id"], name: "index_art_works_on_artist_id"
  end

  create_table "artist_cities", force: :cascade do |t|
    t.bigint "artist_id"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_artist_cities_on_artist_id"
    t.index ["city_id"], name: "index_artist_cities_on_city_id"
  end

  create_table "artists", force: :cascade do |t|
    t.integer "studio_id"
    t.string "name"
    t.string "website"
    t.string "instagram"
    t.text "about"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "collective", default: false
  end

  create_table "cities", force: :cascade do |t|
    t.integer "country_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "collection_entries", force: :cascade do |t|
    t.bigint "collection_id"
    t.string "collectionable_type"
    t.bigint "collectionable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collection_id"], name: "index_collection_entries_on_collection_id"
    t.index ["collectionable_type", "collectionable_id"], name: "index_collection_entries_on_collectionable"
  end

  create_table "collections", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "country_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exhibition_art_works", force: :cascade do |t|
    t.bigint "exhibition_id"
    t.bigint "art_work_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["art_work_id"], name: "index_exhibition_art_works_on_art_work_id"
    t.index ["exhibition_id"], name: "index_exhibition_art_works_on_exhibition_id"
  end

  create_table "exhibition_artists", force: :cascade do |t|
    t.bigint "exhibition_id"
    t.bigint "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_exhibition_artists_on_artist_id"
    t.index ["exhibition_id"], name: "index_exhibition_artists_on_exhibition_id"
  end

  create_table "exhibitions", force: :cascade do |t|
    t.string "title"
    t.text "overview"
    t.string "url"
    t.boolean "visited", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "galleries", force: :cascade do |t|
    t.integer "city_id"
    t.integer "organisation_id"
    t.integer "studio_id"
    t.string "type", null: false
    t.string "name"
    t.string "website"
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "address_line_3"
    t.string "postcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gallery_artists", force: :cascade do |t|
    t.bigint "gallery_id"
    t.bigint "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_gallery_artists_on_artist_id"
    t.index ["gallery_id"], name: "index_gallery_artists_on_gallery_id"
  end

  create_table "gallery_exhibitions", force: :cascade do |t|
    t.bigint "gallery_id"
    t.bigint "exhibition_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exhibition_id"], name: "index_gallery_exhibitions_on_exhibition_id"
    t.index ["gallery_id"], name: "index_gallery_exhibitions_on_gallery_id"
  end

  create_table "installations", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "date_of_creation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "style"
  end

  create_table "items", force: :cascade do |t|
    t.integer "collection_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "opening_times", force: :cascade do |t|
    t.integer "gallery_id"
    t.integer "day_of_week"
    t.time "opens_at"
    t.time "closes_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "opportunities", force: :cascade do |t|
    t.integer "city_id"
    t.integer "organisation_id"
    t.string "name"
    t.text "description"
    t.string "type", null: false
    t.string "website"
    t.datetime "application_opens_at"
    t.datetime "application_closes_at"
    t.boolean "free"
    t.boolean "funded"
  end

  create_table "organisations", force: :cascade do |t|
    t.integer "city_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "paintings", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "date_of_creation"
    t.string "style"
    t.string "technique"
    t.string "support"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "studios", force: :cascade do |t|
    t.integer "organisation_id"
    t.string "name"
    t.string "website"
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "address_line_3"
    t.string "postcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "tag_id"
    t.string "taggable_type"
    t.bigint "taggable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
