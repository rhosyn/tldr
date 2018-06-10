class AddSourceIdToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :newsapi_source_id, :string
    rename_column :articles, :newsapi_source, :newsapi_source_name
  end
end
