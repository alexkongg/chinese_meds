class AddRenderBodyToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :rendered_description, :text
    add_column :articles, :rendered_content, :text
  end
end
