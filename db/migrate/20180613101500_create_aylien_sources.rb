class CreateAylienSources < ActiveRecord::Migration[5.2]
  def change
    create_table :aylien_sources do |t|
      t.integer :source_id
      t.string :source_name
      t.string :loc_country
      t.float :alexa_rank
      t.string :img_url

      t.timestamps
    end
  end
end
