class CreateHerbs < ActiveRecord::Migration
  def change
    create_table :herbs do |t|
      t.string :title
      t.text :description
      t.text :content

      t.timestamps
    end
    add_index :herbs, :created_at
    add_index :herbs, :title
  end
end
