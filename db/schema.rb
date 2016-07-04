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

ActiveRecord::Schema.define(version: 20160703193316) do

  create_table "account_types", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.integer  "chart_of_account_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "account_types", ["chart_of_account_id"], name: "index_account_types_on_chart_of_account_id"

  create_table "accounts", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.float    "balance"
    t.integer  "account_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "accounts", ["account_type_id"], name: "index_accounts_on_account_type_id"

  create_table "analytic_accounts", force: :cascade do |t|
    t.integer  "code"
    t.string   "name"
    t.text     "description"
    t.float    "balance"
    t.integer  "synthetic_account_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "analytic_accounts", ["synthetic_account_id"], name: "index_analytic_accounts_on_synthetic_account_id"

  create_table "chart_of_accounts", force: :cascade do |t|
    t.string   "title"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "chart_of_accounts", ["company_id"], name: "index_chart_of_accounts_on_company_id"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "cnpj"
    t.string   "field_of_work"
    t.string   "address"
    t.string   "cep"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "companies", ["user_id"], name: "index_companies_on_user_id"

  create_table "operations", force: :cascade do |t|
    t.float    "value"
    t.text     "description"
    t.date     "release_date"
    t.integer  "release_account_id"
    t.integer  "retrieve_account_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "operations", ["release_account_id"], name: "index_operations_on_release_account_id"
  add_index "operations", ["retrieve_account_id"], name: "index_operations_on_retrieve_account_id"

  create_table "synthetic_accounts", force: :cascade do |t|
    t.integer  "code"
    t.string   "name"
    t.text     "description"
    t.float    "balance"
    t.integer  "account_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "synthetic_accounts", ["account_id"], name: "index_synthetic_accounts_on_account_id"

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
