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

ActiveRecord::Schema.define(version: 20170304192610) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "landlords", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.integer  "number"
    t.integer  "zip"
    t.string   "locality"
    t.string   "email"
    t.string   "baccount"
    t.boolean  "follower"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leases", force: :cascade do |t|
    t.integer  "signature_month"
    t.integer  "signature_year"
    t.integer  "start_month"
    t.integer  "start_year"
    t.integer  "indexation_year"
    t.string   "region"
    t.integer  "landlord_id"
    t.integer  "tenant_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "leases", ["landlord_id"], name: "index_leases_on_landlord_id", using: :btree
  add_index "leases", ["tenant_id"], name: "index_leases_on_tenant_id", using: :btree

  create_table "tenants", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.integer  "number"
    t.integer  "zip"
    t.string   "locality"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "leases", "landlords"
  add_foreign_key "leases", "tenants"
end
