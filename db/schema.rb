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

ActiveRecord::Schema.define(version: 20170224222153) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abilities", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "action"
  end

  add_index "abilities", ["name"], name: "index_abilities_on_name", unique: true, using: :btree

  create_table "abilities_roles", force: :cascade do |t|
    t.integer "ability_id"
    t.integer "role_id"
  end

  add_index "abilities_roles", ["ability_id"], name: "index_abilities_roles_on_ability_id", using: :btree
  add_index "abilities_roles", ["role_id"], name: "index_abilities_roles_on_role_id", using: :btree

  create_table "adults", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "mname"
    t.integer  "sex",                  limit: 2
    t.date     "dob"
    t.integer  "household_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "is_head_of_household"
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
    t.string   "code"
    t.date     "intake_date"
    t.integer  "age"
  end

  add_index "children", ["code"], name: "index_children_on_code", unique: true, using: :btree

  create_table "children_services", force: :cascade do |t|
    t.integer  "child_id"
    t.integer  "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "children_services", ["child_id"], name: "index_children_services_on_child_id", using: :btree
  add_index "children_services", ["service_id"], name: "index_children_services_on_service_id", using: :btree

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "custom_fields", force: :cascade do |t|
    t.string   "name"
    t.string   "field_type"
    t.text     "selections"
    t.text     "validation_rules"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "custom_section_id"
    t.string   "help_text"
    t.integer  "sort_order"
    t.string   "model_type"
  end

  create_table "custom_sections", force: :cascade do |t|
    t.string   "title"
    t.string   "model_type"
    t.integer  "sort_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "frequencies", force: :cascade do |t|
    t.string "code", default: "NOT SET", null: false
    t.string "name", default: "NOT SET", null: false
  end

  create_table "households", force: :cascade do |t|
    t.string   "name",                            null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "code"
    t.date     "intake_date"
    t.string   "intake_form_number"
    t.string   "housing_number"
    t.string   "home_number"
    t.string   "district"
    t.integer  "area",                  limit: 2
    t.string   "references_for_access"
  end

  add_index "households", ["code"], name: "index_households_on_code", unique: true, using: :btree

  create_table "income_sources", force: :cascade do |t|
    t.string   "name"
    t.integer  "estimated_volume_produced"
    t.integer  "estimated_volume_sold"
    t.decimal  "estimated_income"
    t.integer  "household_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "income_sources", ["household_id"], name: "index_income_sources_on_household_id", using: :btree

  create_table "indicator_details", force: :cascade do |t|
    t.integer  "indicator_id"
    t.integer  "reporting_period_id"
    t.decimal  "target"
    t.decimal  "actual"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "indicator_details", ["indicator_id"], name: "index_indicator_details_on_indicator_id", using: :btree
  add_index "indicator_details", ["reporting_period_id"], name: "index_indicator_details_on_reporting_period_id", using: :btree

  create_table "indicators", force: :cascade do |t|
    t.string   "code",                                            null: false
    t.text     "indicator",                                       null: false
    t.string   "indicator_type"
    t.text     "use"
    t.text     "definitions"
    t.integer  "user_id"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.decimal  "baseline",               precision: 15, scale: 4
    t.integer  "unit_of_measure_id",                              null: false
    t.integer  "reporting_frequency_id"
    t.string   "frequency_definitions"
  end

  add_index "indicators", ["reporting_frequency_id"], name: "index_indicators_on_reporting_frequency_id", using: :btree
  add_index "indicators", ["unit_of_measure_id"], name: "index_indicators_on_unit_of_measure_id", using: :btree

  create_table "intake_actor_types", force: :cascade do |t|
    t.string "name", default: "NOT SET", null: false
  end

  create_table "intake_actors", force: :cascade do |t|
    t.integer  "household_id",         null: false
    t.integer  "intake_actor_type_id", null: false
    t.date     "action_date"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "locales", force: :cascade do |t|
    t.string   "code",       null: false
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "location_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.integer  "project_id"
    t.integer  "location_type_id"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "locations", ["location_type_id"], name: "index_locations_on_location_type_id", using: :btree
  add_index "locations", ["project_id"], name: "index_locations_on_project_id", using: :btree

  create_table "people", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.integer  "sex",                  limit: 2
    t.date     "dob"
    t.integer  "age"
    t.integer  "household_id"
    t.date     "intake_date"
    t.boolean  "is_head_of_household"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "project_target_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_targets", force: :cascade do |t|
    t.integer  "project_id",             null: false
    t.integer  "project_target_type_id", null: false
    t.decimal  "target"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "project_targets", ["project_id"], name: "index_project_targets_on_project_id", using: :btree
  add_index "project_targets", ["project_target_type_id"], name: "index_project_targets_on_project_target_type_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name",                         null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "title"
    t.string   "cooperative_agreement_number"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "organization"
    t.decimal  "funding_amount"
    t.integer  "region_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reporting_periods", force: :cascade do |t|
    t.date     "start_date", null: false
    t.date     "end_date",   null: false
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reporting_statuses", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.integer  "indicator_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_users", force: :cascade do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id"], name: "index_roles_users_on_role_id", using: :btree
  add_index "roles_users", ["user_id"], name: "index_roles_users_on_user_id", using: :btree

  create_table "service_instances", force: :cascade do |t|
    t.integer  "child_id"
    t.integer  "service_id"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "hours"
    t.text     "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "service_instances", ["child_id"], name: "index_service_instances_on_child_id", using: :btree
  add_index "service_instances", ["service_id"], name: "index_service_instances_on_service_id", using: :btree

  create_table "service_type_categories", force: :cascade do |t|
    t.string "name",       default: "NOT SET", null: false
    t.string "definition"
  end

  create_table "service_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "definition"
    t.integer  "service_type_category_id"
  end

  add_index "service_types", ["service_type_category_id"], name: "index_service_types_on_service_type_category_id", using: :btree

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "service_type_id"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "description"
  end

  add_index "services", ["service_type_id"], name: "index_services_on_service_type_id", using: :btree

  create_table "targets", force: :cascade do |t|
    t.integer  "reporting_period_id",           null: false
    t.integer  "work_status_id"
    t.integer  "gender",              limit: 2
    t.decimal  "target_value"
    t.integer  "indicator_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "targets", ["indicator_id"], name: "index_targets_on_indicator_id", using: :btree

  create_table "technical_progress_reports", force: :cascade do |t|
    t.integer  "reporting_period_id",                 null: false
    t.integer  "reporting_status_id",                 null: false
    t.boolean  "tpr_included",        default: false, null: false
    t.boolean  "annex_a_included",    default: false, null: false
    t.boolean  "annex_b_included",    default: false, null: false
    t.boolean  "annex_c_included",    default: false, null: false
    t.boolean  "annex_d_included",    default: false, null: false
    t.boolean  "annex_e_included",    default: false, null: false
    t.boolean  "annex_f_included",    default: false, null: false
    t.boolean  "annex_g_included",    default: false, null: false
    t.boolean  "annex_h_included",    default: false, null: false
    t.boolean  "annex_i_included",    default: false, null: false
    t.string   "submitted_by"
    t.date     "date_submitted"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "technical_progress_reports", ["reporting_period_id"], name: "index_technical_progress_reports_on_reporting_period_id", using: :btree
  add_index "technical_progress_reports", ["reporting_status_id"], name: "index_technical_progress_reports_on_reporting_status_id", using: :btree

  create_table "translations", force: :cascade do |t|
    t.string   "locale"
    t.string   "key"
    t.text     "value"
    t.text     "interpolations"
    t.boolean  "is_proc",        default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "unit_of_measures", force: :cascade do |t|
    t.string "name"
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
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "work_statuses", force: :cascade do |t|
    t.string "name"
    t.string "work_type"
  end

  add_foreign_key "abilities_roles", "abilities"
  add_foreign_key "abilities_roles", "roles"
  add_foreign_key "adults", "households"
  add_foreign_key "children_services", "children"
  add_foreign_key "children_services", "services"
  add_foreign_key "income_sources", "households"
  add_foreign_key "indicator_details", "indicators"
  add_foreign_key "indicator_details", "reporting_periods"
  add_foreign_key "indicators", "frequencies", column: "reporting_frequency_id"
  add_foreign_key "indicators", "unit_of_measures"
  add_foreign_key "intake_actors", "households"
  add_foreign_key "intake_actors", "intake_actor_types"
  add_foreign_key "locations", "location_types"
  add_foreign_key "locations", "projects"
  add_foreign_key "people", "households"
  add_foreign_key "project_targets", "project_target_types"
  add_foreign_key "project_targets", "projects"
  add_foreign_key "projects", "regions"
  add_foreign_key "roles_users", "roles"
  add_foreign_key "roles_users", "users"
  add_foreign_key "service_instances", "children"
  add_foreign_key "service_instances", "services"
  add_foreign_key "service_types", "service_type_categories"
  add_foreign_key "services", "service_types"
  add_foreign_key "targets", "indicators"
  add_foreign_key "targets", "reporting_periods"
  add_foreign_key "technical_progress_reports", "reporting_periods"
  add_foreign_key "technical_progress_reports", "reporting_statuses"
end
