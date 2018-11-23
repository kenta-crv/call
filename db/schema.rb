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

ActiveRecord::Schema.define(version: 2018_11_22_055616) do

  create_table "comments", force: :cascade do |t|
    t.string "responsible"
    t.string "product"
    t.string "statu"
    t.datetime "time"
    t.string "detail"
    t.integer "sfa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sfa_id"], name: "index_comments_on_sfa_id"
  end

  create_table "details", force: :cascade do |t|
    t.string "statu"
    t.datetime "time"
    t.string "comment"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_details_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "company"
    t.string "store"
    t.string "owner"
    t.string "kana"
    t.string "tel"
    t.string "tel2"
    t.string "fax"
    t.string "industry"
    t.string "mail"
    t.string "url"
    t.string "people"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sfas", force: :cascade do |t|
    t.string "company"
    t.string "store"
    t.string "owner"
    t.string "kana"
    t.string "person"
    t.string "p_kana"
    t.string "tel"
    t.string "tel2"
    t.string "fax"
    t.string "industry"
    t.string "mail"
    t.string "url"
    t.string "people"
    t.string "post_number"
    t.string "address"
    t.string "employment"
    t.string "social"
    t.string "appointer"
    t.string "sales_staff"
    t.string "sales_day"
    t.string "status"
    t.string "target"
    t.string "sales_forecast"
    t.string "impression"
    t.string "repeat_sales"
    t.string "next_sales"
    t.string "prospect"
    t.string "ditails"
    t.string "examination"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
