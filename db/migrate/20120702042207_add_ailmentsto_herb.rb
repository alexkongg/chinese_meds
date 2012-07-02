class AddAilmentstoHerb < ActiveRecord::Migration
  def change
    add_column :herbs, :ailment, :string
  end
end
