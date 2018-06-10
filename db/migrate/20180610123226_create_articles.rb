class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :newsapi_title
      t.text :newsapi_description
      t.string :newsapi_imgeurl
      t.string :newsapi_articleurl
      t.string :newsapi_author
      t.datetime :newsapi_publishedat
      t.integer :newsapi_resultno
      t.text :newsapi_source
      t.string :newsapi_category
      t.text :smmry_keywords
      t.text :smmry_content
      t.integer :smmry_charcount
      t.integer :smmry_contentreduced

      t.timestamps
    end
  end
end
