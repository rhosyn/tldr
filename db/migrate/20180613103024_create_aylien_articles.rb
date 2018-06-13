class CreateAylienArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :aylien_articles do |t|
      t.integer :aylien_article_id
      t.string :title
      t.text :summary_sentences
      t.references :aylien_source, foreign_key: true
      t.string :img_url
      t.string :video_url
      t.string :title_polarity_sentiment
      t.float :title_polarity_score
      t.string :body_polarity_sentiment
      t.float :body_polarity_score
      t.datetime :published_at
      t.string :article_url
      t.string :related_stories_url
      t.string :coverages_url
      t.integer :fb_shares
      t.integer :li_shares
      t.integer :goog_shares
      t.integer :reddit_shares
      t.string :cluster_name
      t.text :cluster_stories
      t.float :cluster_score

      t.timestamps
    end
  end
end
