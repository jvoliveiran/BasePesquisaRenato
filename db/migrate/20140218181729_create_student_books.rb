class CreateStudentBooks < ActiveRecord::Migration
  def change
    create_table :student_books do |t|
      t.references :student
      t.references :book

      t.index [:student_id, :book_id], unique: true

      t.timestamps
    end
  end
end
