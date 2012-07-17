class AddPermalinkToMoxibustions < ActiveRecord::Migration
  def self.up
    add_column :moxibustions, :permalink, :string
    add_index :moxibustions, :permalink
  end
  def self.down
    remove_column :moxibustions, :permalink
  end
end