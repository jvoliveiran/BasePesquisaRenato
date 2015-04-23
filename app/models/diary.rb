class Diary < ActiveRecord::Base
  belongs_to :year
  belongs_to :servant
  belongs_to :discipline

  has_many :students, :through => :student_diaries
  has_many :student_diaries
end
