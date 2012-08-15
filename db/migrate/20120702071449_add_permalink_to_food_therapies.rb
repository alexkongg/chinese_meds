class AddPermalinkToFoodTherapies < ActiveRecord::Migration
  def self.up
    add_column :food_therapies, :permalink, :string
    add_index :food_therapies, :permalink
  end
  def self.down
    remove_column :food_therapies, :permalink
  end
end