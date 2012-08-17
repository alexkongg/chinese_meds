class AddMoreAttributesColumnToHerbs < ActiveRecord::Migration
  def change
    add_column :herbs, :chemical_composition, :text
    add_column :herbs, :side_effects, :text
    add_column :herbs, :rendered_chemical_composition, :text
    add_column :herbs, :rendered_side_effects, :text
  end
end
