class CreateAylienCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :aylien_categories do |t|
      t.string :category
      t.string :iab

      t.timestamps
    end
  end
end
