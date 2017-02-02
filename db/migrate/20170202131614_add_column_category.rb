class AddColumnCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :title, :string
  end
end
