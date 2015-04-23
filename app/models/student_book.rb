class StudentBook < ActiveRecord::Base
  belongs_to :student
  belongs_to :book
  belongs_to :book_observation
end
