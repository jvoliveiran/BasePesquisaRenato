class CreateRoleServants < ActiveRecord::Migration
  def change
    create_table :role_servants do |t|
      t.references :role
      t.references :servant

      t.index [:role_id, :servant_id], unique: true

      t.timestamps
    end
  end
end
