class AddPermalinkToScientificStudy < ActiveRecord::Migration
  def self.up
    add_column :scientific_studies, :permalink, :string
    add_index :scientific_studies, :permalink
  end
  def self.down
    remove_column :scientific_studies, :permalink
  end
end