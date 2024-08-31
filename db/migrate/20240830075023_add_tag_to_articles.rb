class AddTagToArticles < ActiveRecord::Migration[7.2]
  def change
    add_column :articles, :tag, :string
  end
end
