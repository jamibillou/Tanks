class CreateTiroirs < ActiveRecord::Migration
  def change
    create_table :tiroirs do |t|
      t.string :site
      t.integer :numero

      t.timestamps
    end
  end
end
