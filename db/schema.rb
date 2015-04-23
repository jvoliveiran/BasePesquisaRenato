# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140406141414) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "book_observations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: true do |t|
    t.integer  "yearbook"
    t.string   "turn"
    t.string   "classname"
    t.integer  "workshop_id"
    t.integer  "lesson_id"
    t.integer  "year_id"
    t.integer  "book_observation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "books", ["book_observation_id"], name: "index_books_on_book_observation_id", using: :btree
  add_index "books", ["lesson_id"], name: "index_books_on_lesson_id", using: :btree
  add_index "books", ["workshop_id"], name: "index_books_on_workshop_id", using: :btree
  add_index "books", ["year_id"], name: "index_books_on_year_id", using: :btree

  create_table "diaries", force: true do |t|
    t.integer  "year_id"
    t.integer  "discipline_id"
    t.integer  "servant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "discipline_servants", force: true do |t|
    t.integer  "discipline_id"
    t.integer  "servant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "discipline_servants", ["discipline_id", "servant_id"], name: "index_discipline_servants_on_discipline_id_and_servant_id", unique: true, using: :btree

  create_table "disciplines", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "lesson_books", force: true do |t|
    t.integer  "lesson_id"
    t.integer  "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lesson_books", ["lesson_id", "book_id"], name: "index_lesson_books_on_lesson_id_and_book_id", unique: true, using: :btree

  create_table "lessons", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "professions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "role_servants", force: true do |t|
    t.integer  "role_id"
    t.integer  "servant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "role_servants", ["role_id", "servant_id"], name: "index_role_servants_on_role_id_and_servant_id", unique: true, using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "servants", force: true do |t|
    t.string   "name"
    t.integer  "year_born"
    t.string   "place_of_birth"
    t.string   "civil_state"
    t.integer  "year_in"
    t.integer  "year_out"
    t.text     "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "wage"
  end

  create_table "student_books", force: true do |t|
    t.integer  "student_id"
    t.integer  "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "book_observation_id"
  end

  add_index "student_books", ["book_observation_id"], name: "index_student_books_on_book_observation_id", using: :btree
  add_index "student_books", ["student_id", "book_id"], name: "index_student_books_on_student_id_and_book_id", unique: true, using: :btree

  create_table "student_diaries", force: true do |t|
    t.float    "value_amount_f"
    t.float    "value_amount_c"
    t.float    "average"
    t.string   "behavior"
    t.string   "application"
    t.integer  "absence"
    t.integer  "book_observation_id"
    t.integer  "student_id"
    t.integer  "diary_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "student_diaries", ["diary_id", "student_id"], name: "index_student_diaries_on_diary_id_and_student_id", unique: true, using: :btree

  create_table "students", force: true do |t|
    t.string   "name"
    t.string   "responsible"
    t.integer  "age"
    t.string   "neighborhood"
    t.string   "street"
    t.integer  "profession_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",               default: "",    null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.boolean  "admin",                  default: false, null: false
    t.boolean  "locked",                 default: false, null: false
    t.string   "slug"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "workshops", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "years", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
