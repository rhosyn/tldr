class CreateAylienArticleBatches < ActiveRecord::Migration[5.2]
  def change
    create_table :aylien_article_batches do |t|
      t.integer :batch_id
      t.references :aylien_article, foreign_key: true

      t.timestamps
    end
  end
end
