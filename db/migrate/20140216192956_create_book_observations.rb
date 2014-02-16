class CreateBookObservations < ActiveRecord::Migration
  def change
    create_table :book_observations do |t|
      t.string :name

      t.timestamps
    end
  end
end
