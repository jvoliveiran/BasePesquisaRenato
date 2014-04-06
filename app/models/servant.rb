class Servant < ActiveRecord::Base
  has_many :role_servants
  has_many :roles, :through => :role_servants

  has_many :disciplines, :through => :discipline_servants
  has_many :discipline_servants

  has_many :diaries, dependent: :nullify

  CIVIL_STATE = ["", "Casado", "Solteiro", "Viuvo"]

  validates_presence_of :name
  validates_length_of :name, :in => 5..100
  validates_numericality_of :wage, :only_integer => true
end
