class CreateAylienArticleKeywords < ActiveRecord::Migration[5.2]
  def change
    create_table :aylien_article_keywords do |t|
      t.references :aylien_keyword, foreign_key: true
      t.references :aylien_article, foreign_key: true

      t.timestamps
    end
  end
end
