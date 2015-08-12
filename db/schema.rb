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

ActiveRecord::Schema.define(version: 20150811055307) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "acudientes", force: :cascade do |t|
    t.string   "nombre"
    t.string   "apellidos"
    t.string   "identificacion"
    t.string   "ocupacion"
    t.string   "cargo"
    t.string   "empresa"
    t.string   "direccion"
    t.string   "telefono"
    t.string   "celular"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
  end

  add_index "acudientes", ["email"], name: "index_acudientes_on_email", unique: true
  add_index "acudientes", ["reset_password_token"], name: "index_acudientes_on_reset_password_token", unique: true

  create_table "admin_users", force: :cascade do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "documentos", force: :cascade do |t|
    t.string   "tipo_documento"
    t.date     "fecha_ingreso"
    t.text     "observacion"
    t.integer  "estudiante_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "archivo"
    t.string   "adjunto_file_name"
    t.string   "adjunto_content_type"
    t.integer  "adjunto_file_size"
    t.datetime "adjunto_updated_at"
  end

  create_table "estudiantes", force: :cascade do |t|
    t.string   "nombre"
    t.string   "apellidos"
    t.integer  "edad"
    t.string   "doc_identidad"
    t.string   "lugar_expedicion"
    t.integer  "grado"
    t.date     "f_nacimiento"
    t.string   "institucion_anterior"
    t.integer  "grado_aspirado"
    t.string   "estado"
    t.integer  "acudiente_id"
    t.date     "f_examen"
    t.date     "f_matricula"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "horarios", force: :cascade do |t|
    t.date     "fecha"
    t.time     "hora_inicio"
    t.time     "hora_fin"
    t.string   "tipo_tramite"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "volantes", force: :cascade do |t|
    t.string   "concepto"
    t.integer  "valor"
    t.date     "f_generacion"
    t.date     "f_ingreso"
    t.string   "numero_comprobante"
    t.integer  "estudiante_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "soporte_file_name"
    t.string   "soporte_content_type"
    t.integer  "soporte_file_size"
    t.datetime "soporte_updated_at"
  end

end
