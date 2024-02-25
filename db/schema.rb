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

ActiveRecord::Schema[7.1].define(version: 6) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "creatives_type"
    t.bigint "creatives_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creatives_type", "creatives_id"], name: "index_artists_on_creatives"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "country_code"
    t.string "placeable_type"
    t.bigint "placeable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["placeable_type", "placeable_id"], name: "index_countries_on_placeable"
  end

  create_table "exhibitions", force: :cascade do |t|
    t.string "title"
    t.string "gallery_name"
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
