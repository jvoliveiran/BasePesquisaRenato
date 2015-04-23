class CreateLessonBooks < ActiveRecord::Migration
  def change
    create_table :lesson_books do |t|
      t.references :lesson
      t.references :book

      t.index [:lesson_id, :book_id], unique: true

      t.timestamps
    end
  end
end
