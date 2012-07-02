class CreateScientificStudies < ActiveRecord::Migration
  def change
    create_table :scientific_studies do |t|
      t.string :title
      t.text :content
      t.text :rendered_content
      t.timestamps
    end
  end
end
