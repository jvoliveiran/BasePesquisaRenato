class Discipline < ActiveRecord::Base
  has_many :servants, :through => :discipline_servants
  has_many :discipline_servants

  validates_presence_of :name
  validates_length_of :name, :in => 5..50
end
