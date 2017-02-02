class CreateAdverts < ActiveRecord::Migration[5.0]
  def change
    create_table :adverts do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.integer :category_id

      t.timestamps
    end
  end
end
