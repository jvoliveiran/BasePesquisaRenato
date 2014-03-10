class Year < ActiveRecord::Base
  has_many :books, dependent: :nullify
  has_many :diaries, dependent: :nullify

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_length_of :name, :in => 3..100
end
