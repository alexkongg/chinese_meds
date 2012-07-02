class AddPermalinkToAcupuncture < ActiveRecord::Migration
  def self.up
    add_column :acupunctures, :permalink, :string
    add_index :acupunctures, :permalink
  end
  def self.down
    remove_column :acupunctures, :permalink
  end
end