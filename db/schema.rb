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

ActiveRecord::Schema.define(version: 2018_06_13_103346) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "aylien_article_keywords", force: :cascade do |t|
    t.bigint "aylien_keyword_id"
    t.bigint "aylien_article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aylien_article_id"], name: "index_aylien_article_keywords_on_aylien_article_id"
    t.index ["aylien_keyword_id"], name: "index_aylien_article_keywords_on_aylien_keyword_id"
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
  add_foreign_key "aylien_article_keywords", "aylien_articles"
  add_foreign_key "aylien_article_keywords", "aylien_keywords"
  add_foreign_key "aylien_articles", "aylien_sources"
end
