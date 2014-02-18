class Book < ActiveRecord::Base
  belongs_to :workshop
  belongs_to :lesson
  belongs_to :year
  belongs_to :book_observation
  has_and_belongs_to_many :students, join_table: :student_books

  validates_presence_of :year, :turn, :classname
end
