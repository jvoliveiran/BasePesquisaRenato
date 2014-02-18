class Student < ActiveRecord::Base
  belongs_to :profession
  has_and_belongs_to_many :books, join_table: :student_books

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_numericality_of :age, only_integer: true

end
