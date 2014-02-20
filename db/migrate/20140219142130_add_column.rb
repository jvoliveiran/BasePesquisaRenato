class AddColumn < ActiveRecord::Migration
  def change
    add_reference :student_books, :book_observation, index: true
  end
end
