class CreateAylienHashtags < ActiveRecord::Migration[5.2]
  def change
    create_table :aylien_hashtags do |t|
      t.string :hashtag

      t.timestamps
    end
  end
end
