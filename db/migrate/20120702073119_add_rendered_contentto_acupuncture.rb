class AddRenderedContenttoAcupuncture < ActiveRecord::Migration
  def change
    add_column :acupunctures, :rendered_content, :string
    add_column :tcms, :rendered_content, :string
    add_column :scientific_studies, :rendered_content, :string
    add_column :moxibustions, :rendered_content, :string
    add_column :cuppings, :rendered_content, :string
    add_column :food_therapies, :rendered_content, :string
  end
end
