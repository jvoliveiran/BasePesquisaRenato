class Student < ActiveRecord::Base
  belongs_to :profession

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_numericality_of :age, only_integer: true

end
