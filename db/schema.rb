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

ActiveRecord::Schema.define(version: 20151215223153) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adults", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "mname"
    t.integer  "sex",          limit: 2
    t.date     "dob"
    t.integer  "household_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "adults", ["household_id"], name: "index_adults_on_household_id", using: :btree

  create_table "child_statuses", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "work_status_id"
    t.integer  "education_status_id"
    t.text     "note"
    t.integer  "child_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "user_id"
    t.integer  "project_id"
  end

  add_index "child_statuses", ["child_id"], name: "index_child_statuses_on_child_id", using: :btree

  create_table "children", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "mname"
    t.integer  "sex",          limit: 2
    t.date     "dob"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "country",      limit: 2
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "household_id"
    t.string   "avatar"
  end

  create_table "custom_fields", force: :cascade do |t|
    t.string   "name"
    t.string   "field_type"
    t.text     "selections"
    t.text     "validation_rules"
    t.integer  "project_id"
    t.string   "model_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "custom_values", force: :cascade do |t|
    t.integer  "custom_field_id"
    t.text     "value_text"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "model_id"
  end

  create_table "education_statuses", force: :cascade do |t|
    t.string "name"
  end

  create_table "households", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "country",    limit: 2
    t.string   "phone"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "indicators", force: :cascade do |t|
    t.string   "code"
    t.text     "indicator"
    t.string   "indicator_type"
    t.text     "use"
    t.text     "definitions"
    t.text     "frequency"
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "indicators", ["project_id"], name: "index_indicators_on_project_id", using: :btree

  create_table "project_regions", force: :cascade do |t|
    t.string   "country"
    t.string   "state"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "project_regions", ["project_id"], name: "index_project_regions_on_project_id", using: :btree

  create_table "project_users", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.integer  "role_ids",   default: [],              array: true
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "project_users", ["project_id"], name: "index_project_users_on_project_id", using: :btree
  add_index "project_users", ["user_id"], name: "index_project_users_on_user_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
    t.string   "title"
    t.string   "cop_num"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "org"
    t.string   "proj_type"
    t.decimal  "funding"
    t.string   "office_address"
  end

  create_table "projects_children", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "child_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "projects_children", ["child_id"], name: "index_projects_children_on_child_id", using: :btree
  add_index "projects_children", ["project_id"], name: "index_projects_children_on_project_id", using: :btree

  create_table "projects_households", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "household_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "projects_households", ["household_id"], name: "index_projects_households_on_household_id", using: :btree
  add_index "projects_households", ["project_id"], name: "index_projects_households_on_project_id", using: :btree

  create_table "reports", force: :cascade do |t|
    t.string   "title"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "service_ids",  default: [],              array: true
    t.string   "service_type"
    t.text     "target_ids",   default: [],              array: true
    t.string   "target_type"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "user_id"
    t.text     "desc"
    t.integer  "project_id"
    t.integer  "indicator_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_instances", force: :cascade do |t|
    t.integer  "child_id"
    t.integer  "service_id"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "hours"
    t.text     "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "project_id"
  end

  add_index "service_instances", ["child_id"], name: "index_service_instances_on_child_id", using: :btree
  add_index "service_instances", ["project_id"], name: "index_service_instances_on_project_id", using: :btree
  add_index "service_instances", ["service_id"], name: "index_service_instances_on_service_id", using: :btree

  create_table "service_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "service_type_id"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "description"
    t.integer  "project_id"
  end

  add_index "services", ["project_id"], name: "index_services_on_project_id", using: :btree
  add_index "services", ["service_type_id"], name: "index_services_on_service_type_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "work_statuses", force: :cascade do |t|
    t.string "name"
    t.string "work_type"
  end

  add_foreign_key "adults", "households"
  add_foreign_key "child_statuses", "children"
  add_foreign_key "indicators", "projects"
  add_foreign_key "project_regions", "projects"
  add_foreign_key "project_users", "projects"
  add_foreign_key "project_users", "users"
  add_foreign_key "projects_households", "households"
  add_foreign_key "projects_households", "projects"
  add_foreign_key "service_instances", "children"
  add_foreign_key "service_instances", "projects"
  add_foreign_key "service_instances", "services"
  add_foreign_key "services", "projects"
  add_foreign_key "services", "service_types"
end
