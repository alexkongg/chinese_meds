class AddPermalinkToHerb < ActiveRecord::Migration
  def self.up
    add_column :herbs, :permalink, :string
    add_index :herbs, :permalink
  end
  def self.down
    remove_column :herbs, :permalink
  end
end