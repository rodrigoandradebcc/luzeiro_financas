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

ActiveRecord::Schema.define(version: 20160628212532) do

  create_table "accounts_operations", id: false, force: :cascade do |t|
    t.integer "account_id",   null: false
    t.integer "operation_id", null: false
  end

  add_index "accounts_operations", ["account_id", "operation_id"], name: "index_accounts_operations_on_account_id_and_operation_id"
  add_index "accounts_operations", ["operation_id", "account_id"], name: "index_accounts_operations_on_operation_id_and_account_id"

  create_table "balances", force: :cascade do |t|
    t.string   "debit"
    t.string   "credit"
    t.string   "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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

  create_table "fifth_levels", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.boolean  "analytic"
    t.integer  "balance_id"
    t.integer  "fourth_level_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "fifth_levels", ["balance_id"], name: "index_fifth_levels_on_balance_id"
  add_index "fifth_levels", ["fourth_level_id"], name: "index_fifth_levels_on_fourth_level_id"

  create_table "fifth_levels_operations", id: false, force: :cascade do |t|
    t.integer "fifth_level_id", null: false
    t.integer "operation_id",   null: false
  end

  create_table "first_level_second_levels", force: :cascade do |t|
    t.string   "account_type"
    t.string   "group_type"
    t.integer  "first_level_id"
    t.integer  "second_level_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "first_level_second_levels", ["first_level_id"], name: "index_first_level_second_levels_on_first_level_id"
  add_index "first_level_second_levels", ["second_level_id"], name: "index_first_level_second_levels_on_second_level_id"

  create_table "first_levels", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.integer  "chart_of_account_id"
    t.integer  "balance_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "first_levels", ["balance_id"], name: "index_first_levels_on_balance_id"
  add_index "first_levels", ["chart_of_account_id"], name: "index_first_levels_on_chart_of_account_id"

  create_table "fourth_levels", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.boolean  "analytic"
    t.integer  "balance_id"
    t.integer  "third_level_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "fourth_levels", ["balance_id"], name: "index_fourth_levels_on_balance_id"
  add_index "fourth_levels", ["third_level_id"], name: "index_fourth_levels_on_third_level_id"

  create_table "fourth_levels_operations", id: false, force: :cascade do |t|
    t.integer "fourth_level_id", null: false
    t.integer "operation_id",    null: false
  end

  create_table "operations", force: :cascade do |t|
    t.float    "value"
    t.text     "description"
    t.date     "release_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "operations_seventh_levels", id: false, force: :cascade do |t|
    t.integer "operation_id",     null: false
    t.integer "seventh_level_id", null: false
  end

  create_table "operations_sixth_levels", id: false, force: :cascade do |t|
    t.integer "operation_id",   null: false
    t.integer "sixth_level_id", null: false
  end

  create_table "second_levels", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.integer  "balance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "second_levels", ["balance_id"], name: "index_second_levels_on_balance_id"

  create_table "seventh_levels", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.boolean  "analytic"
    t.integer  "balance_id"
    t.integer  "sixth_level_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "seventh_levels", ["balance_id"], name: "index_seventh_levels_on_balance_id"
  add_index "seventh_levels", ["sixth_level_id"], name: "index_seventh_levels_on_sixth_level_id"

  create_table "sixth_levels", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.boolean  "analytic"
    t.integer  "balance_id"
    t.integer  "fifth_level_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "sixth_levels", ["balance_id"], name: "index_sixth_levels_on_balance_id"
  add_index "sixth_levels", ["fifth_level_id"], name: "index_sixth_levels_on_fifth_level_id"

  create_table "third_levels", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.integer  "second_level_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "third_levels", ["second_level_id"], name: "index_third_levels_on_second_level_id"

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
