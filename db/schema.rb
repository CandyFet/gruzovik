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

ActiveRecord::Schema.define(version: 20170914065626) do

  create_table "basket", force: :cascade do |t|
    t.integer  "uid",    limit: 4,   default: 0,   null: false
    t.string   "name",   limit: 125, default: "",  null: false
    t.string   "number", limit: 80,  default: "",  null: false
    t.float    "price",  limit: 24,  default: 0.0, null: false
    t.integer  "count",  limit: 4,   default: 0,   null: false
    t.integer  "cid",    limit: 4,   default: 0,   null: false
    t.datetime "date",                             null: false
  end

  add_index "basket", ["uid"], name: "uid", using: :btree

  create_table "carts", force: :cascade do |t|
    t.integer  "order_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "carts", ["order_id"], name: "index_carts_on_order_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "uid",                limit: 255
    t.string   "image",              limit: 255
    t.text     "description",        limit: 65535
    t.text     "description_bottom", limit: 65535
    t.string   "ancestry",           limit: 255
    t.integer  "position",           limit: 4,     default: 1000
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.integer  "assetable_id",      limit: 4
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width",             limit: 4
    t.integer  "height",            limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "employees", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "image",      limit: 255
    t.string   "post",       limit: 255
    t.string   "work_since", limit: 255
    t.text     "preview",    limit: 65535
    t.integer  "position",   limit: 4,     default: 100
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "form_carwashes", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "amount",     limit: 255
    t.string   "fio",        limit: 255
    t.string   "phone",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "form_rentals", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "phone",      limit: 255
    t.string   "email",      limit: 255
    t.text     "message",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "form_stos", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "phone",           limit: 255
    t.string   "type_of_work",    limit: 255
    t.string   "convenient_date", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "grouptree", id: false, force: :cascade do |t|
    t.integer "IDMODEL",      limit: 4,   default: 0, null: false
    t.integer "GROUPNO",      limit: 4,   default: 0, null: false
    t.integer "PARENT",       limit: 4,   default: 0
    t.string  "GROUPNAME",    limit: 255
    t.string  "GROUPNAMEEN",  limit: 255
    t.string  "PICTUREINDEX", limit: 10
    t.string  "MARK",         limit: 1
    t.integer "SORTORDER",    limit: 4
    t.string  "hru",          limit: 255
  end

  add_index "grouptree", ["hru"], name: "hru", using: :btree

  create_table "line_items", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "cart_id",    limit: 4
    t.string   "number",     limit: 255
    t.integer  "amount",     limit: 4
    t.integer  "price",      limit: 4
    t.integer  "IDMODEL",    limit: 4
    t.integer  "PARTNAMEID", limit: 4
    t.integer  "IDGROUP",    limit: 4
    t.integer  "product_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "line_items", ["IDGROUP"], name: "index_line_items_on_IDGROUP", using: :btree
  add_index "line_items", ["IDMODEL"], name: "index_line_items_on_IDMODEL", using: :btree
  add_index "line_items", ["PARTNAMEID"], name: "index_line_items_on_PARTNAMEID", using: :btree
  add_index "line_items", ["cart_id"], name: "index_line_items_on_cart_id", using: :btree
  add_index "line_items", ["name"], name: "index_line_items_on_name", using: :btree
  add_index "line_items", ["product_id"], name: "index_line_items_on_product_id", using: :btree

  create_table "main_texts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "slug",       limit: 255
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "marks", primary_key: "ID", force: :cascade do |t|
    t.integer "SORTORDER",                 limit: 4
    t.string  "NAMESHORT",                 limit: 50
    t.string  "NAMEFULL",                  limit: 255
    t.string  "VISIBLE",                   limit: 1
    t.string  "GR00",                      limit: 1
    t.string  "GR01",                      limit: 1
    t.string  "GR02",                      limit: 1
    t.string  "GR03",                      limit: 1
    t.string  "GR04",                      limit: 1
    t.string  "GR05",                      limit: 1
    t.string  "GR06",                      limit: 1
    t.string  "PNG_PATHBGPICTURE",         limit: 255
    t.integer "PNG_SELECTCOLOR",           limit: 4
    t.integer "PNG_ANGLESHADOW",           limit: 4
    t.integer "PNG_TRANSPARENCESHADOW",    limit: 4
    t.integer "PNG_DISTANCE",              limit: 4
    t.integer "PNG_RADIUSROUND",           limit: 4
    t.integer "PNG_COLORSHADOW",           limit: 4
    t.integer "PNG_COLORUNSELECTITEMTEXT", limit: 4
    t.string  "PATHICON",                  limit: 255
    t.string  "PATHHTML",                  limit: 255
    t.string  "FAVOURITE",                 limit: 1
    t.string  "GR07",                      limit: 1
    t.binary  "COMMENT",                   limit: 65535
    t.string  "PATHWWW",                   limit: 255
    t.string  "ENAMESHORT",                limit: 50
    t.string  "ENAMEFULL",                 limit: 255
    t.string  "AID",                       limit: 50
    t.text    "HTML_SHORT",                limit: 4294967295, null: false
    t.text    "HTML_FULL",                 limit: 4294967295, null: false
    t.string  "hru",                       limit: 255
  end

  add_index "marks", ["AID"], name: "AID", unique: true, using: :btree
  add_index "marks", ["hru"], name: "hru", using: :btree

  create_table "models", primary_key: "ID", force: :cascade do |t|
    t.string  "ENAMESHORT",     limit: 50
    t.string  "ENAMEFULL",      limit: 255
    t.integer "IDMARK",         limit: 4,          default: 0, null: false
    t.integer "TYPEAUTO",       limit: 4
    t.integer "SORTORDER",      limit: 4
    t.string  "NAMESHORT",      limit: 50
    t.string  "NAMEFULL",       limit: 255
    t.string  "PATHICON",       limit: 255
    t.string  "PATHHTML",       limit: 255
    t.string  "PATHIMAGE",      limit: 255
    t.integer "PICTLENGTH",     limit: 4
    t.integer "DISKNO",         limit: 4
    t.string  "VISIBLE",        limit: 1
    t.integer "COUNTPICTURES",  limit: 4
    t.integer "COUNTPARTS",     limit: 4
    t.integer "COUNTMODIFY",    limit: 4
    t.integer "KOLCOUNT",       limit: 4,          default: 1
    t.string  "OKPO",           limit: 1
    t.string  "FAVOURITE",      limit: 1
    t.string  "SEARCH",         limit: 1
    t.integer "PARENTMODEL",    limit: 4
    t.string  "MARK",           limit: 1
    t.string  "INFOBOOKS",      limit: 255
    t.text    "COMMENT",        limit: 16777215
    t.text    "KOLCOMMENT",     limit: 16777215
    t.text    "INFO",           limit: 16777215
    t.text    "COMMENTPRIM",    limit: 16777215
    t.string  "AID",            limit: 50
    t.integer "BASIS_MODEL_ID", limit: 4
    t.string  "ACTUAL",         limit: 100
    t.text    "HTML_SHORT",     limit: 4294967295,             null: false
    t.text    "HTML_FULL",      limit: 4294967295,             null: false
    t.string  "hru",            limit: 255
  end

  add_index "models", ["AID"], name: "AID", unique: true, using: :btree
  add_index "models", ["hru"], name: "hru", using: :btree

  create_table "news", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "slug",         limit: 255
    t.date     "published_at"
    t.string   "image",        limit: 255
    t.text     "content",      limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "news_images", force: :cascade do |t|
    t.string   "file",       limit: 255
    t.integer  "news_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "news_images", ["news_id"], name: "index_news_images_on_news_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "person",          limit: 255,   default: "entity"
    t.string   "delivery",        limit: 255,   default: "pickup"
    t.string   "payment",         limit: 255,   default: "bill"
    t.string   "company",         limit: 255
    t.string   "post",            limit: 255
    t.string   "company_details", limit: 255
    t.string   "email",           limit: 255
    t.string   "phone",           limit: 255
    t.text     "comments",        limit: 65535
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.string   "file",            limit: 255
  end

  create_table "pages", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "slug",       limit: 255
    t.boolean  "is_page",                  default: true
    t.string   "image",      limit: 255
    t.text     "content",    limit: 65535
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "partname", primary_key: "ID", force: :cascade do |t|
    t.string  "NAME",     limit: 255
    t.string  "NAMEEN",   limit: 255
    t.string  "NUMBER",   limit: 84
    t.string  "OKPO",     limit: 40
    t.string  "ALT1",     limit: 40
    t.string  "ALT2",     limit: 40
    t.string  "ALT3",     limit: 40
    t.float   "PRICE",    limit: 53
    t.string  "CURR",     limit: 5
    t.string  "NAMED",    limit: 255
    t.string  "NAMEISP",  limit: 255
    t.integer "IDMARK",   limit: 4,   default: 0, null: false
    t.string  "MATERIAL", limit: 255
    t.string  "ALT_NAME", limit: 255
  end

  add_index "partname", ["IDMARK"], name: "IDMARK", using: :btree
  add_index "partname", ["NAME"], name: "NAME", using: :btree
  add_index "partname", ["NUMBER"], name: "index_partname_on_NUMBER", using: :btree

  create_table "partname_infos", force: :cascade do |t|
    t.integer  "PARTNAMEID",  limit: 4
    t.string   "uid",         limit: 255
    t.string   "name",        limit: 255
    t.integer  "price",       limit: 4,     default: 0
    t.integer  "residue",     limit: 4,     default: 0
    t.string   "image",       limit: 255
    t.text     "description", limit: 65535
    t.text     "similars",    limit: 65535
    t.float    "width",       limit: 24
    t.float    "height",      limit: 24
    t.float    "length",      limit: 24
    t.string   "file_name",   limit: 255
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "partname_infos", ["PARTNAMEID"], name: "index_partname_infos_on_PARTNAMEID", using: :btree

  create_table "partpicture", primary_key: "ID", force: :cascade do |t|
    t.integer "IDMODEL",        limit: 4,     default: 0,   null: false
    t.integer "IDGROUP",        limit: 4,     default: 0,   null: false
    t.integer "PARTNAMEID",     limit: 4,     default: 0,   null: false
    t.string  "PARTCOUNT",      limit: 96
    t.string  "COMMENT",        limit: 20
    t.text    "INFOPART",       limit: 65535
    t.integer "POSITIONNO",     limit: 2
    t.integer "IDPART",         limit: 4
    t.string  "NAMEOTHER",      limit: 255
    t.float   "PRICE",          limit: 24,    default: 0.0, null: false
    t.string  "CURR",           limit: 10,    default: "",  null: false
    t.string  "POSITIONNO_STR", limit: 50
    t.integer "SORT_ORDER",     limit: 4
    t.integer "LINK_3D",        limit: 4
    t.text    "PARTCOMMENT",    limit: 65535
  end

  add_index "partpicture", ["IDGROUP"], name: "IDGROUP", using: :btree
  add_index "partpicture", ["IDMODEL"], name: "IDMODEL", using: :btree
  add_index "partpicture", ["PARTNAMEID"], name: "PARTNAMEID", using: :btree

  create_table "pplr", primary_key: "IDRECTANGLE", force: :cascade do |t|
    t.integer "IDPARTPICTURE", limit: 4, default: 0, null: false
  end

  add_index "pplr", ["IDPARTPICTURE"], name: "IDPARTPICTURE", using: :btree

  create_table "price", force: :cascade do |t|
    t.string  "number",  limit: 128, null: false
    t.string  "name",    limit: 255, null: false
    t.integer "price",   limit: 4,   null: false
    t.integer "count",   limit: 4,   null: false
    t.integer "artikul", limit: 4,   null: false
  end

  create_table "price_parts", force: :cascade do |t|
    t.integer "price_id", limit: 4, null: false
    t.integer "part_id",  limit: 4, null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "category_id", limit: 4
    t.string   "uid",         limit: 255
    t.string   "number",      limit: 255
    t.boolean  "is_new",                    default: false
    t.string   "promotion",   limit: 255
    t.integer  "price",       limit: 4,     default: 0
    t.integer  "residue",     limit: 4
    t.string   "image",       limit: 255
    t.text     "description", limit: 65535
    t.text     "similars",    limit: 65535
    t.float    "width",       limit: 24
    t.float    "height",      limit: 24
    t.float    "length",      limit: 24
    t.string   "file_name",   limit: 255
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  create_table "promotions", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "slug",         limit: 255
    t.boolean  "on_main",                    default: false
    t.date     "published_at"
    t.text     "content",      limit: 65535
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "image",        limit: 255
  end

  create_table "rectangle", id: false, force: :cascade do |t|
    t.integer "ID", limit: 4, default: 0, null: false
    t.integer "DX", limit: 4
    t.integer "DY", limit: 4
  end

  add_index "rectangle", ["ID"], name: "ID", using: :btree

  create_table "rental_images", force: :cascade do |t|
    t.string   "file",       limit: 255
    t.integer  "position",   limit: 4,   default: 100
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "s_marks", id: false, force: :cascade do |t|
    t.integer "idsite",     limit: 4, default: 0, null: false
    t.integer "idmark",     limit: 4, default: 0, null: false
    t.integer "sort",       limit: 4, default: 0, null: false
    t.integer "idtypeauto", limit: 4, default: 0, null: false
    t.integer "visible",    limit: 4, default: 1
  end

  add_index "s_marks", ["idsite"], name: "idsite", using: :btree

  create_table "s_models", id: false, force: :cascade do |t|
    t.integer "idsite",     limit: 4, default: 0, null: false
    t.integer "idmodel",    limit: 4, default: 0, null: false
    t.integer "sort",       limit: 4, default: 0, null: false
    t.integer "idtypeauto", limit: 4, default: 0, null: false
    t.integer "idmark",     limit: 4, default: 0, null: false
    t.integer "visible",    limit: 4, default: 1
  end

  add_index "s_models", ["idmodel", "idmark", "idtypeauto"], name: "idmodel", unique: true, using: :btree
  add_index "s_models", ["idsite"], name: "idsite", using: :btree

  create_table "search", id: false, force: :cascade do |t|
    t.integer "MARKID",     limit: 4,   default: 0,  null: false
    t.string  "MARKNAME",   limit: 50,  default: "", null: false
    t.integer "MODELID",    limit: 4,   default: 0,  null: false
    t.integer "TYPEAUTO",   limit: 4,   default: 0,  null: false
    t.string  "MODELNAME",  limit: 50,  default: "", null: false
    t.integer "ID",         limit: 4,   default: 0,  null: false
    t.integer "PARTNAMEID", limit: 4,   default: 0,  null: false
    t.string  "NAME",       limit: 255, default: "", null: false
    t.string  "NUMBER",     limit: 100, default: "", null: false
    t.integer "G0ID",       limit: 4,   default: 0,  null: false
    t.string  "G0NAME",     limit: 255, default: "", null: false
    t.integer "G1ID",       limit: 4,   default: 0,  null: false
    t.string  "G1NAME",     limit: 255, default: "", null: false
    t.integer "G2ID",       limit: 4,   default: 0,  null: false
    t.string  "G2NAME",     limit: 255, default: "", null: false
  end

  add_index "search", ["G0ID"], name: "G0ID", using: :btree
  add_index "search", ["G1ID"], name: "G1ID", using: :btree
  add_index "search", ["G2ID"], name: "G2ID", using: :btree
  add_index "search", ["MARKID"], name: "MARKID", using: :btree
  add_index "search", ["MODELID"], name: "MODELID", using: :btree
  add_index "search", ["NAME"], name: "NAME", type: :fulltext
  add_index "search", ["NUMBER"], name: "NUMBER", type: :fulltext
  add_index "search", ["PARTNAMEID"], name: "PARTNAMEID", using: :btree

  create_table "sids", force: :cascade do |t|
    t.string   "sid",  limit: 255, default: "", null: false
    t.datetime "date",                          null: false
  end

  add_index "sids", ["sid"], name: "sid", unique: true, using: :btree

  create_table "sites", force: :cascade do |t|
    t.string  "name",        limit: 255, default: "", null: false
    t.integer "treelevel",   limit: 4,   default: 0,  null: false
    t.integer "stat_marks",  limit: 4,   default: 0,  null: false
    t.integer "stat_models", limit: 4,   default: 0,  null: false
    t.integer "stat_parts",  limit: 4,   default: 0,  null: false
  end

  create_table "typeauto", force: :cascade do |t|
    t.string  "name",     limit: 255, default: "",  null: false
    t.string  "aid",      limit: 50
    t.integer "idsite",   limit: 4,   default: 0,   null: false
    t.integer "sort",     limit: 4,   default: 0,   null: false
    t.integer "visible",  limit: 4,   default: 1
    t.string  "hru",      limit: 255
    t.integer "position", limit: 4,   default: 100
  end

  add_index "typeauto", ["aid", "idsite"], name: "aid", unique: true, using: :btree
  add_index "typeauto", ["hru"], name: "hru", using: :btree
  add_index "typeauto", ["idsite"], name: "idsite", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.boolean  "is_admin",                           default: false
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "carts", "orders"
  add_foreign_key "line_items", "carts"
  add_foreign_key "line_items", "products"
  add_foreign_key "news_images", "news"
  add_foreign_key "products", "categories"
end
