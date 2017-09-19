# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170919044939) do

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "book_code"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cover_image_file_name"
    t.string "cover_image_content_type"
    t.integer "cover_image_file_size"
    t.datetime "cover_image_updated_at"
    t.integer "chapters_count"
    t.index ["book_code"], name: "index_books_on_book_code", unique: true
  end

  create_table "chapters", force: :cascade do |t|
    t.string "chapter_title"
    t.string "language", default: "en"
    t.string "status", default: "unpublished"
    t.datetime "release_date"
    t.string "content"
    t.integer "chapter_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "book_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "role", default: "1"
    t.string "password_digest"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_confirmation"
    t.boolean "email_confirmed", default: false
    t.string "confirm_token"
    t.string "remember_digest"
    t.string "auth_token"
    t.string "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

end
