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

ActiveRecord::Schema.define(version: 20150217043463) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "rhinoart_files", force: true do |t|
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.string   "file"
    t.string   "file_content_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rhinoart_galleries", force: true do |t|
    t.integer  "page_id"
    t.string   "url",        limit: 150
    t.string   "name",                                  null: false
    t.text     "descr"
    t.boolean  "active",                 default: true
    t.integer  "position",                              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rhinoart_galleries", ["name"], name: "index_rhinoart_galleries_on_name", unique: true, using: :btree
  add_index "rhinoart_galleries", ["url"], name: "index_rhinoart_galleries_on_url", unique: true, using: :btree

  create_table "rhinoart_gallery_images", force: true do |t|
    t.integer  "gallery_id"
    t.string   "path",       limit: 150
    t.text     "annotation"
    t.boolean  "main",                   default: false, null: false
    t.boolean  "active",                 default: true,  null: false
    t.integer  "position",                               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "params"
  end

  add_index "rhinoart_gallery_images", ["gallery_id", "path"], name: "index_rhinoart_gallery_images_on_gallery_id_and_path", unique: true, using: :btree

  create_table "rhinoart_page_comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "page_id"
    t.integer  "parent_id"
    t.text     "comment",                    null: false
    t.boolean  "approved",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rhinoart_page_contents", force: true do |t|
    t.integer "page_id"
    t.string  "name",     limit: 100, null: false
    t.text    "content"
    t.integer "position",             null: false
  end

  add_index "rhinoart_page_contents", ["name"], name: "index_rhinoart_page_contents_on_name", using: :btree
  add_index "rhinoart_page_contents", ["page_id", "name"], name: "index_rhinoart_page_contents_on_page_id_and_name", unique: true, using: :btree

  create_table "rhinoart_page_fields", force: true do |t|
    t.integer "page_id",              null: false
    t.string  "name",     limit: 120, null: false
    t.text    "value"
    t.string  "ftype",    limit: 60
    t.integer "position",             null: false
  end

  add_index "rhinoart_page_fields", ["page_id", "name"], name: "page_fields_page_id_and_name", unique: true, using: :btree

  create_table "rhinoart_pages", force: true do |t|
    t.integer  "parent_id"
    t.string   "name",                                                                null: false
    t.string   "slug",                                                                null: false
    t.integer  "position",                                                            null: false
    t.integer  "menu",                                             default: 1
    t.boolean  "active",                                           default: true
    t.string   "ptype",        limit: 20,                          default: "page",   null: false
    t.string   "sm_p",         limit: 7,                           default: "weekly", null: false
    t.decimal  "st_pr",                   precision: 10, scale: 2, default: 0.5,      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "publish_date",                                                        null: false
    t.integer  "user_id"
  end

  add_index "rhinoart_pages", ["parent_id", "slug"], name: "index_rhinoart_pages_on_parent_id_and_slug", unique: true, using: :btree

  create_table "rhinoart_settings", force: true do |t|
    t.string "name",  limit: 120, default: "", null: false
    t.text   "value"
    t.text   "descr"
  end

  add_index "rhinoart_settings", ["name"], name: "index_rhinoart_settings_on_name", unique: true, using: :btree

  create_table "rhinoart_users", force: true do |t|
    t.string   "name",                   limit: 250
    t.string   "email",                  limit: 100,                 null: false
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",                 default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "admin_role"
    t.string   "frontend_role"
    t.boolean  "approved",                           default: false, null: false
    t.text     "info"
  end

  add_index "rhinoart_users", ["email"], name: "index_rhinoart_users_on_email", unique: true, using: :btree
  add_index "rhinoart_users", ["remember_token"], name: "index_rhinoart_users_on_remember_token", using: :btree
  add_index "rhinoart_users", ["reset_password_token"], name: "index_rhinoart_users_on_reset_password_token", unique: true, using: :btree

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.string   "locale"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  add_foreign_key "rhinoart_galleries", "rhinoart_pages", name: "rhinoart_galleries_page_id_fk", column: "page_id", dependent: :delete

  add_foreign_key "rhinoart_gallery_images", "rhinoart_galleries", name: "rhinoart_gallery_images_gallery_id_fk", column: "gallery_id", dependent: :delete

  add_foreign_key "rhinoart_page_comments", "rhinoart_page_comments", name: "rhinoart_page_comments_parent_id_fk", column: "parent_id", dependent: :delete
  add_foreign_key "rhinoart_page_comments", "rhinoart_pages", name: "rhinoart_page_comments_page_id_fk", column: "page_id"
  add_foreign_key "rhinoart_page_comments", "rhinoart_users", name: "rhinoart_page_comments_user_id_fk", column: "user_id", dependent: :delete

  add_foreign_key "rhinoart_page_contents", "rhinoart_pages", name: "rhinoart_page_contents_page_id_fk", column: "page_id", dependent: :delete

  add_foreign_key "rhinoart_page_fields", "rhinoart_pages", name: "rhinoart_page_fields_page_id_fk", column: "page_id", dependent: :delete

  add_foreign_key "rhinoart_pages", "rhinoart_pages", name: "rhinoart_pages_parent_id_fk", column: "parent_id", dependent: :delete
  add_foreign_key "rhinoart_pages", "rhinoart_users", name: "rhinoart_pages_user_id_fk", column: "user_id"

end
