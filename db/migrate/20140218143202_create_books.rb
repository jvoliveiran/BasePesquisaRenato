class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :year
      t.string :turn
      t.string :classname
      t.references :workshop, index: true
      t.references :lesson, index: true
      t.references :year, index: true
      t.references :book_observation, index: true

      t.timestamps
    end
  end
end
