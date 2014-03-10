class CreateStudentDiaries < ActiveRecord::Migration
  def change
    create_table :student_diaries do |t|
      t.float :value_amount_f
      t.float :value_amount_c
      t.float :average
      t.string :behavior
      t.string :application
      t.integer :absence
      t.references :book_observation

      t.references :student
      t.references :diary

      t.index [:diary_id, :student_id], unique: true

      t.timestamps
    end
  end
end
