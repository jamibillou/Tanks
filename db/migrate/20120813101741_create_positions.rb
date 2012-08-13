class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.integer :boite_id
      t.integer :numero

      t.timestamps
    end
  end
end
