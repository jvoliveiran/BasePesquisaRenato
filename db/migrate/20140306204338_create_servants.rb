class CreateServants < ActiveRecord::Migration
  def change
    create_table :servants do |t|
      t.string :name
      t.integer :year_born
      t.string :place_of_birth
      t.string :civil_state
      t.integer :year_in
      t.integer :year_out
      t.text :obs

      t.timestamps
    end
  end
end
