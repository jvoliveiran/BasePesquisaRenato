class Year < ActiveRecord::Base
  has_many :books, dependent: :nullify

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_length_of :name, :in => 3..100
end
