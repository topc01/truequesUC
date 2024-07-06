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

ActiveRecord::Schema[7.0].define(version: 2023_11_21_155947) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrators", force: :cascade do |t|
    t.string "username"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_administrators_on_email", unique: true
    t.index ["reset_password_token"], name: "index_administrators_on_reset_password_token", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_products", id: false, force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "category_id", null: false
    t.index ["category_id"], name: "index_categories_products_on_category_id"
    t.index ["product_id"], name: "index_categories_products_on_product_id"
  end

  create_table "chats", force: :cascade do |t|
    t.bigint "client1_id", null: false
    t.bigint "client2_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client1_id"], name: "index_chats_on_client1_id"
    t.index ["client2_id"], name: "index_chats_on_client2_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.text "description"
    t.string "image"
    t.string "phone_number"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "image_data"
    t.boolean "is_admin", default: false
    t.index ["email"], name: "index_clients_on_email", unique: true
    t.index ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true
  end

  create_table "comment_responses", force: :cascade do |t|
    t.bigint "id_comment"
    t.bigint "id_response"
    t.text "texto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "client_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_comments_on_client_id"
    t.index ["product_id"], name: "index_comments_on_product_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "chat_id", null: false
    t.bigint "client_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
    t.index ["client_id"], name: "index_messages_on_client_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.bigint "client_id", null: false
    t.text "description"
    t.integer "weight"
    t.string "clasification"
    t.integer "use"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "available", default: true
    t.text "image_data"
    t.index ["client_id"], name: "index_products_on_client_id"
  end

  create_table "requests", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "offer_id", null: false
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_requests_on_offer_id"
    t.index ["product_id"], name: "index_requests_on_product_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "sender_id", null: false
    t.text "title"
    t.integer "grade"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_reviews_on_client_id"
    t.index ["sender_id"], name: "index_reviews_on_sender_id"
  end

  add_foreign_key "categories_products", "categories"
  add_foreign_key "categories_products", "products"
  add_foreign_key "chats", "clients", column: "client1_id"
  add_foreign_key "chats", "clients", column: "client2_id"
  add_foreign_key "comments", "clients"
  add_foreign_key "comments", "products"
  add_foreign_key "messages", "chats"
  add_foreign_key "messages", "clients"
  add_foreign_key "products", "clients"
  add_foreign_key "requests", "products"
  add_foreign_key "requests", "products", column: "offer_id"
  add_foreign_key "reviews", "clients"
  add_foreign_key "reviews", "clients", column: "sender_id"
end
