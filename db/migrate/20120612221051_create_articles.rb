class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.text :content

      t.timestamps
    end
    add_index :microposts, :created_at
  end
end
