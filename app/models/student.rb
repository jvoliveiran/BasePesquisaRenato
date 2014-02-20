class Student < ActiveRecord::Base
  belongs_to :profession
  has_many :student_books
  has_many :books, :through => :student_books
  #has_and_belongs_to_many :book_observations, join_table: :student_books

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_numericality_of :age, only_integer: true

end
