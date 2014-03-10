class StudentDiary < ActiveRecord::Base
  belongs_to :student
  belongs_to :diary
  belongs_to :book_observation

  validates :value_amount_f, numericality: true
  validates :value_amount_c, numericality: true
  validates :average, numericality: true
  validates :absence, numericality: {only_integer:  true}
end
