class CreateTcms < ActiveRecord::Migration
  def change
    create_table :tcms do |t|
      t.string :title
      t.string :book
      t.text :content
      t.text :rendered_content
      t.timestamps
    end
    add_index :tcms, [:book]
  end
end
