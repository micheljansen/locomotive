# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080814141021) do

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contracts", :force => true do |t|
    t.integer  "client_id"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contracts", ["service_id"], :name => "index_contracts_on_service_id"
  add_index "contracts", ["client_id"], :name => "index_contracts_on_client_id"

  create_table "plugin_instances", :force => true do |t|
    t.string   "plugin_type"
    t.integer  "version"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plugin_properties", :force => true do |t|
    t.string   "key"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "plugin_instance_id"
  end

  create_table "releases", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "service_id"
  end

  add_index "releases", ["service_id"], :name => "index_releases_on_service_id"

  create_table "service_instances", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
