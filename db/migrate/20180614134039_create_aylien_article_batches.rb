class CreateAylienArticleBatches < ActiveRecord::Migration[5.2]
  def change
    create_table :batches do |t|
      t.string :batch_type
      t.references :aylien_category, foreign_key: true
      t.datetime :window_start
      t.datetime :window_end

      t.timestamps
    end

    create_table :aylien_article_batches do |t|
      t.references :batch, foreign_key: true
      t.references :aylien_article, foreign_key: true
      t.integer :article_sequence_no

      t.timestamps
    end
  end
end
