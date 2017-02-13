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

ActiveRecord::Schema.define(version: 20170213040310) do

  create_table "misions", force: :cascade do |t|
    t.string   "nombre"
    t.string   "nivel"
    t.text     "descripcion"
    t.string   "urltemario"
    t.string   "urlimagen"
    t.string   "comentario"
    t.boolean  "habilitado"
    t.boolean  "visible"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "objetivos", force: :cascade do |t|
    t.integer  "mision_id"
    t.string   "nombre"
    t.string   "descripcion"
    t.string   "urlvideo"
    t.text     "instructivo"
    t.string   "urlevaluativo"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
