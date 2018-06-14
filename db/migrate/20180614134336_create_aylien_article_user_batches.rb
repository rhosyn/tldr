class CreateAylienArticleUserBatches < ActiveRecord::Migration[5.2]
  def change
    create_table :aylien_article_user_batches do |t|
      t.references :aylien_article_batch, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
