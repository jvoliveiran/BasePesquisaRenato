class BookObservation < ActiveRecord::Base
  has_many :student_books
  has_many :books, :through => :student_books
  #has_and_belongs_to_many :students, join_table: :student_books

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_length_of :name, :in => 3..100
end
