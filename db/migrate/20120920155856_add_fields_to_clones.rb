class AddFieldsToClones < ActiveRecord::Migration
  def change
    add_column :clones, :date_banking, :datetime

    add_column :clones, :milieu_congelation, :string

    add_column :clones, :tests, :string

  end
end
