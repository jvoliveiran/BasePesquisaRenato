class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :responsible
      t.integer :age
      t.string :neighborhood
      t.string :street
      t.references :profession

      t.timestamps
    end
  end
end
