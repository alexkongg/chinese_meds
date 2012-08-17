class ChangeColumnNamesHerbs < ActiveRecord::Migration
  def change
    change_table :herbs do |t|
      t.rename :title, :name
      t.rename :content, :overview
      t.rename :rendered_content, :rendered_overview
      t.rename :description, :physical_description
      t.rename :rendered_description, :rendered_physical_description
      
    end
  end
end
