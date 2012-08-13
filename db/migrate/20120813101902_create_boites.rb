class CreateBoites < ActiveRecord::Migration
  def change
    create_table :boites do |t|
      t.integer :numero
      t.integer :tiroir_id

      t.timestamps
    end
  end
end
