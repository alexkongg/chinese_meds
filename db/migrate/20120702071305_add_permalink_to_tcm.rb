class AddPermalinkToTcm < ActiveRecord::Migration
  def self.up
    add_column :tcms, :permalink, :string
    add_index :tcms, :permalink
  end
  def self.down
    remove_column :tcms, :permalink
  end
end