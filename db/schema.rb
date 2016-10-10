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

ActiveRecord::Schema.define(version: 20160911012146) do

  create_table "account_types", force: :cascade do |t|
    t.integer  "code",                limit: 4
    t.string   "name",                limit: 255
    t.decimal  "total_balance",                   precision: 10, scale: 2
    t.integer  "chart_of_account_id", limit: 4
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
  end

  add_index "account_types", ["chart_of_account_id"], name: "index_account_types_on_chart_of_account_id", using: :btree

  create_table "accounts", force: :cascade do |t|
    t.integer  "code",            limit: 4
    t.string   "name",            limit: 255
    t.text     "description",     limit: 65535
    t.decimal  "balance",                       precision: 10, scale: 2
    t.integer  "account_type_id", limit: 4
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
  end

  add_index "accounts", ["account_type_id"], name: "index_accounts_on_account_type_id", using: :btree

  create_table "analytic_accounts", force: :cascade do |t|
    t.integer  "code",                        limit: 4
    t.string   "name",                        limit: 255
    t.text     "description",                 limit: 65535
    t.decimal  "balance",                                   precision: 10, scale: 2, default: 0.0
    t.integer  "second_synthetic_account_id", limit: 4
    t.integer  "listenable_id",               limit: 4
    t.string   "listenable_type",             limit: 255
    t.datetime "created_at",                                                                       null: false
    t.datetime "updated_at",                                                                       null: false
  end

  add_index "analytic_accounts", ["listenable_type", "listenable_id"], name: "index_analytic_accounts_on_listenable_type_and_listenable_id", using: :btree
  add_index "analytic_accounts", ["second_synthetic_account_id"], name: "index_analytic_accounts_on_second_synthetic_account_id", using: :btree

  create_table "chart_of_accounts", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.integer  "company_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "chart_of_accounts", ["company_id"], name: "index_chart_of_accounts_on_company_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "cnpj",          limit: 255
    t.string   "field_of_work", limit: 255
    t.string   "address",       limit: 255
    t.string   "cep",           limit: 255
    t.integer  "user_id",       limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "companies", ["user_id"], name: "index_companies_on_user_id", using: :btree

  create_table "old_balances", force: :cascade do |t|
    t.integer  "operation_id",        limit: 4
    t.integer  "analytic_account_id", limit: 4
    t.decimal  "value",                         precision: 10, scale: 2
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
  end

  add_index "old_balances", ["analytic_account_id"], name: "index_old_balances_on_analytic_account_id", using: :btree
  add_index "old_balances", ["operation_id"], name: "index_old_balances_on_operation_id", using: :btree

  create_table "operations", force: :cascade do |t|
    t.decimal  "value",                             precision: 10, scale: 2
    t.text     "description",         limit: 65535
    t.date     "release_date"
    t.integer  "release_account_id",  limit: 4
    t.integer  "retrieve_account_id", limit: 4
    t.integer  "operational_id",      limit: 4
    t.string   "operational_type",    limit: 255
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
  end

  add_index "operations", ["operational_type", "operational_id"], name: "index_operations_on_operational_type_and_operational_id", using: :btree
  add_index "operations", ["release_account_id"], name: "index_operations_on_release_account_id", using: :btree
  add_index "operations", ["retrieve_account_id"], name: "index_operations_on_retrieve_account_id", using: :btree

  create_table "results", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.text     "description",         limit: 65535
    t.integer  "analytic_account_id", limit: 4
    t.string   "kind",                limit: 255
    t.decimal  "balance",                           precision: 10, scale: 2, default: 0.0
    t.date     "init"
    t.date     "final"
    t.datetime "created_at",                                                               null: false
    t.datetime "updated_at",                                                               null: false
  end

  add_index "results", ["analytic_account_id"], name: "index_results_on_analytic_account_id", using: :btree

  create_table "second_synthetic_accounts", force: :cascade do |t|
    t.integer  "code",                 limit: 4
    t.string   "name",                 limit: 255
    t.text     "description",          limit: 65535
    t.decimal  "balance",                            precision: 10, scale: 2
    t.integer  "synthetic_account_id", limit: 4
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
  end

  add_index "second_synthetic_accounts", ["synthetic_account_id"], name: "index_second_synthetic_accounts_on_synthetic_account_id", using: :btree

  create_table "synthetic_accounts", force: :cascade do |t|
    t.integer  "code",        limit: 4
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.decimal  "balance",                   precision: 10, scale: 2
    t.integer  "account_id",  limit: 4
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "synthetic_accounts", ["account_id"], name: "index_synthetic_accounts_on_account_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "account_types", "chart_of_accounts"
  add_foreign_key "accounts", "account_types"
  add_foreign_key "analytic_accounts", "second_synthetic_accounts"
  add_foreign_key "chart_of_accounts", "companies"
  add_foreign_key "companies", "users"
  add_foreign_key "old_balances", "analytic_accounts"
  add_foreign_key "old_balances", "operations"
  add_foreign_key "results", "analytic_accounts"
  add_foreign_key "second_synthetic_accounts", "synthetic_accounts"
  add_foreign_key "synthetic_accounts", "accounts"
end
