class CreateArticleCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :article_categories do |t|
      t.references :aylien_category, foreign_key: true
      t.references :aylien_article, foreign_key: true
      t.string :confident
      t.float :score

      t.timestamps
    end
  end
end
