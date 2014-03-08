class Servant < ActiveRecord::Base
  has_many :roles, :through => :role_servants
  has_many :role_servants

  has_many :disciplines, :through => :discipline_servants
  has_many :discipline_servants

  CIVIL_STATE = ["", "Casado", "Solteiro", "Viuvo"]

  validates_presence_of :name
  validates_length_of :name, :in => 5..100
end
