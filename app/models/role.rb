class Role < ActiveRecord::Base
  has_many :servants, :through => :role_servants
  has_many :role_servants

  validates_presence_of :name
  validates_length_of :name, :in => 5..50
end
