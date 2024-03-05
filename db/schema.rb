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

ActiveRecord::Schema[7.1].define(version: 15) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.string "name"
    t.text "description"
    t.string "website"
    t.string "instagram"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.integer "country_id"
    t.string "name"
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
    t.text "description"
    t.string "url"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "galleries", force: :cascade do |t|
    t.integer "city_id"
    t.string "type", null: false
    t.string "name"
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
    t.string "medium_1"
    t.string "medium_2"
    t.string "medium_3"
    t.string "medium_4"
    t.string "medium_5"
    t.string "medium_6"
    t.string "medium_7"
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

  create_table "paintings", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "date_of_creation"
    t.string "style"
    t.string "technique"
    t.string "medium_1"
    t.string "medium_2"
    t.string "medium_3"
    t.string "support"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.string "taggable_type"
    t.bigint "taggable_id"
    t.bigint "tag_id"
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
