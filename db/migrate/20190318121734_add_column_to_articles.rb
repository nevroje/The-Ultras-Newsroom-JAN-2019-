class AddColumnToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :approved, :boolean
  end
end
