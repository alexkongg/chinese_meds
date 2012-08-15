class CreateFoodTherapies < ActiveRecord::Migration
  def change
    create_table :food_therapies do |t|
      t.string :title
      t.text :content
      t.text :rendered_content
      t.timestamps
    end
  end
end
