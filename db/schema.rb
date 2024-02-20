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

ActiveRecord::Schema[7.1].define(version: 11) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artist_countries", force: :cascade do |t|
    t.bigint "artist_id"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_artist_countries_on_artist_id"
    t.index ["country_id"], name: "index_artist_countries_on_country_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "country_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exhibition_artists", force: :cascade do |t|
    t.bigint "exhibition_id"
    t.bigint "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_exhibition_artists_on_artist_id"
    t.index ["exhibition_id"], name: "index_exhibition_artists_on_exhibition_id"
  end

  create_table "exhibition_countries", force: :cascade do |t|
    t.bigint "exhibition_id"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_exhibition_countries_on_country_id"
    t.index ["exhibition_id"], name: "index_exhibition_countries_on_exhibition_id"
  end

  create_table "exhibitions", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "url"
    t.string "image_url"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "galleries", force: :cascade do |t|
    t.string "name"
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "address_line_3"
    t.string "town"
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

  create_table "gallery_countries", force: :cascade do |t|
    t.bigint "gallery_id"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_gallery_countries_on_country_id"
    t.index ["gallery_id"], name: "index_gallery_countries_on_gallery_id"
  end

  create_table "gallery_exhibitions", force: :cascade do |t|
    t.bigint "gallery_id"
    t.bigint "exhibition_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exhibition_id"], name: "index_gallery_exhibitions_on_exhibition_id"
    t.index ["gallery_id"], name: "index_gallery_exhibitions_on_gallery_id"
  end

  create_table "opening_times", force: :cascade do |t|
    t.integer "gallery_id"
    t.integer "day_of_week"
    t.time "opens_at"
    t.time "closes_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
