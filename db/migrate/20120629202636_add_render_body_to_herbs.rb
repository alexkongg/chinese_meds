class AddRenderBodyToHerbs < ActiveRecord::Migration
  def change
    add_column :herbs, :rendered_description, :text
    add_column :herbs, :rendered_content, :text
  end
end
