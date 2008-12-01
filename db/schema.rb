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

ActiveRecord::Schema.define(:version => 20081201121936) do

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

  add_index "contracts", ["client_id"], :name => "index_contracts_on_client_id"
  add_index "contracts", ["service_id"], :name => "index_contracts_on_service_id"

  create_table "dependencies", :force => true do |t|
    t.integer  "role_id"
    t.integer  "service_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "platform_memberships", :force => true do |t|
    t.integer  "server_id"
    t.integer  "platform_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "platforms", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "plugin_schema_info", :id => false, :force => true do |t|
    t.string  "plugin_name"
    t.integer "version"
  end

  create_table "purposes", :force => true do |t|
    t.integer  "role_id"
    t.integer  "server_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "releases", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "service_id"
  end

  add_index "releases", ["service_id"], :name => "index_releases_on_service_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "servers", :force => true do |t|
    t.string   "name"
    t.string   "hostname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_instances", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "platform_id"
    t.integer  "client_id"
  end

  create_table "service_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "service_type_type"
  end

  create_table "subsystems", :force => true do |t|
    t.integer  "port"
    t.integer  "server"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
