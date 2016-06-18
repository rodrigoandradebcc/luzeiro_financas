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

ActiveRecord::Schema.define(version: 20160613032113) do

  create_table "accounts", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.string   "nature_of_the_balance"
    t.float    "credit_balance"
    t.float    "debit_balance"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "chart_of_account_id"
  end

  add_index "accounts", ["chart_of_account_id"], name: "index_accounts_on_chart_of_account_id"

  create_table "accounts_operations", id: false, force: :cascade do |t|
    t.integer "account_id",   null: false
    t.integer "operation_id", null: false
  end

  add_index "accounts_operations", ["account_id", "operation_id"], name: "index_accounts_operations_on_account_id_and_operation_id"
  add_index "accounts_operations", ["operation_id", "account_id"], name: "index_accounts_operations_on_operation_id_and_account_id"

  create_table "chart_of_accounts", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "enterprise_id"
  end

  add_index "chart_of_accounts", ["enterprise_id"], name: "index_chart_of_accounts_on_enterprise_id"

  create_table "elements", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.float    "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enterprises", force: :cascade do |t|
    t.string   "name"
    t.string   "cnpj"
    t.string   "field_of_work"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
  end

  add_index "enterprises", ["user_id"], name: "index_enterprises_on_user_id"

  create_table "groups", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "operations", force: :cascade do |t|
    t.float    "value"
    t.string   "description"
    t.string   "release_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "subelements", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subgroups", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subitems", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
