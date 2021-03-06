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

ActiveRecord::Schema.define(version: 2018_06_14_134336) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ahoy_events", force: :cascade do |t|
    t.bigint "visit_id"
    t.bigint "user_id"
    t.string "name"
    t.jsonb "properties"
    t.datetime "time"
    t.index ["name", "time"], name: "index_ahoy_events_on_name_and_time"
    t.index ["properties"], name: "index_ahoy_events_on_properties_jsonb_path_ops", opclass: :jsonb_path_ops, using: :gin
    t.index ["user_id"], name: "index_ahoy_events_on_user_id"
    t.index ["visit_id"], name: "index_ahoy_events_on_visit_id"
  end

  create_table "ahoy_visits", force: :cascade do |t|
    t.string "visit_token"
    t.string "visitor_token"
    t.bigint "user_id"
    t.string "ip"
    t.text "user_agent"
    t.text "referrer"
    t.string "referring_domain"
    t.text "landing_page"
    t.string "browser"
    t.string "os"
    t.string "device_type"
    t.string "country"
    t.string "region"
    t.string "city"
    t.string "utm_source"
    t.string "utm_medium"
    t.string "utm_term"
    t.string "utm_content"
    t.string "utm_campaign"
    t.datetime "started_at"
    t.index ["user_id"], name: "index_ahoy_visits_on_user_id"
    t.index ["visit_token"], name: "index_ahoy_visits_on_visit_token", unique: true
  end

  create_table "article_categories", force: :cascade do |t|
    t.bigint "aylien_category_id"
    t.bigint "aylien_article_id"
    t.string "confident"
    t.float "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aylien_article_id"], name: "index_article_categories_on_aylien_article_id"
    t.index ["aylien_category_id"], name: "index_article_categories_on_aylien_category_id"
  end

  create_table "article_hashtags", force: :cascade do |t|
    t.bigint "aylien_hashtag_id"
    t.bigint "aylien_article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aylien_article_id"], name: "index_article_hashtags_on_aylien_article_id"
    t.index ["aylien_hashtag_id"], name: "index_article_hashtags_on_aylien_hashtag_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "newsapi_title"
    t.text "newsapi_description"
    t.string "newsapi_imgeurl"
    t.string "newsapi_articleurl"
    t.string "newsapi_author"
    t.datetime "newsapi_publishedat"
    t.integer "newsapi_resultno"
    t.text "newsapi_source_name"
    t.string "newsapi_category"
    t.text "smmry_keywords"
    t.text "smmry_content"
    t.integer "smmry_charcount"
    t.integer "smmry_contentreduced"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "newsapi_source_id"
  end

  create_table "aylien_article_batches", force: :cascade do |t|
    t.bigint "batch_id"
    t.bigint "aylien_article_id"
    t.integer "article_sequence_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aylien_article_id"], name: "index_aylien_article_batches_on_aylien_article_id"
    t.index ["batch_id"], name: "index_aylien_article_batches_on_batch_id"
  end

  create_table "aylien_article_keywords", force: :cascade do |t|
    t.bigint "aylien_keyword_id"
    t.bigint "aylien_article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aylien_article_id"], name: "index_aylien_article_keywords_on_aylien_article_id"
    t.index ["aylien_keyword_id"], name: "index_aylien_article_keywords_on_aylien_keyword_id"
  end

  create_table "aylien_article_user_batches", force: :cascade do |t|
    t.bigint "batch_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batch_id"], name: "index_aylien_article_user_batches_on_batch_id"
    t.index ["user_id"], name: "index_aylien_article_user_batches_on_user_id"
  end

  create_table "aylien_articles", force: :cascade do |t|
    t.integer "aylien_article_id"
    t.string "title"
    t.text "summary_sentences"
    t.bigint "aylien_source_id"
    t.string "img_url"
    t.string "video_url"
    t.string "title_polarity_sentiment"
    t.float "title_polarity_score"
    t.string "body_polarity_sentiment"
    t.float "body_polarity_score"
    t.datetime "published_at"
    t.string "article_url"
    t.string "related_stories_url"
    t.string "coverages_url"
    t.integer "fb_shares"
    t.integer "li_shares"
    t.integer "goog_shares"
    t.integer "reddit_shares"
    t.string "cluster_name"
    t.text "cluster_stories"
    t.float "cluster_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aylien_source_id"], name: "index_aylien_articles_on_aylien_source_id"
  end

  create_table "aylien_categories", force: :cascade do |t|
    t.string "category"
    t.string "iab"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "aylien_hashtags", force: :cascade do |t|
    t.string "hashtag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "aylien_keywords", force: :cascade do |t|
    t.string "keyword"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "aylien_sources", force: :cascade do |t|
    t.integer "source_id"
    t.string "source_name"
    t.string "loc_country"
    t.float "alexa_rank"
    t.string "img_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "batches", force: :cascade do |t|
    t.string "batch_type"
    t.bigint "aylien_category_id"
    t.datetime "window_start"
    t.datetime "window_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aylien_category_id"], name: "index_batches_on_aylien_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "article_categories", "aylien_articles"
  add_foreign_key "article_categories", "aylien_categories"
  add_foreign_key "article_hashtags", "aylien_articles"
  add_foreign_key "article_hashtags", "aylien_hashtags"
  add_foreign_key "aylien_article_batches", "aylien_articles"
  add_foreign_key "aylien_article_batches", "batches"
  add_foreign_key "aylien_article_keywords", "aylien_articles"
  add_foreign_key "aylien_article_keywords", "aylien_keywords"
  add_foreign_key "aylien_article_user_batches", "batches"
  add_foreign_key "aylien_article_user_batches", "users"
  add_foreign_key "aylien_articles", "aylien_sources"
  add_foreign_key "batches", "aylien_categories"
end
