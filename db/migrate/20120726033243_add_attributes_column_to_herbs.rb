class AddAttributesColumnToHerbs < ActiveRecord::Migration
  def change
    add_column :herbs, :chinese_name, :string
    add_column :herbs, :medicinal_description, :text
    add_column :herbs, :rendered_medicinal_description, :text
    add_column :herbs, :precautions, :text
    add_column :herbs, :rendered_precautions, :text
    add_column :herbs, :recent_studies, :text
    add_column :herbs, :rendered_recent_studies, :text
    add_column :herbs, :common_name, :string
  end
end
