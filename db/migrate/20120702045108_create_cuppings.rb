class CreateCuppings < ActiveRecord::Migration
  def change
    create_table :cuppings do |t|
      t.string :title
      t.text :content
      t.text :rendered_content
      t.timestamps
    end
  end
end
