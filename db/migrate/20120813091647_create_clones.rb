class CreateClones < ActiveRecord::Migration
  def change
    create_table :clones do |t|
      t.string :typeI
      t.string :typeII
      t.integer :client_id
      t.string :nom
      t.string :reference
      t.string :origine
      t.string :localisation

      t.timestamps
    end
  end
end
