class AddPermalinkToCuppings < ActiveRecord::Migration
  def self.up
    add_column :cuppings, :permalink, :string
    add_index :cuppings, :permalink
  end
  def self.down
    remove_column :cuppings, :permalink
  end
end