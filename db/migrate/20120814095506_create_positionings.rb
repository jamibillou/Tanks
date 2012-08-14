class CreatePositionings < ActiveRecord::Migration
  def change
    create_table :positionings do |t|
      t.integer :clone_id
      t.integer :user_id
      t.integer :position_id_ref
      t.integer :position_id_travail

      t.timestamps
    end
  end
end
