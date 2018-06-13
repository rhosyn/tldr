class CreateArticleHashtags < ActiveRecord::Migration[5.2]
  def change
    create_table :article_hashtags do |t|
      t.references :hashtag, foreign_key: true
      t.references :aylien_source, foreign_key: true

      t.timestamps
    end
  end
end
