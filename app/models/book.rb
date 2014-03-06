class Book < ActiveRecord::Base
  belongs_to :workshop
  has_many :lessons, :through => :lesson_books
  has_many :lesson_books
  belongs_to :year
  has_many :student_books
  has_many :students, :through => :student_books
  has_many :book_observations, :through => :student_books
  #has_and_belongs_to_many :students, join_table: :student_books
  #has_and_belongs_to_many :book_observations, join_table: :student_books

  validates_presence_of :year, :turn, :classname
end
