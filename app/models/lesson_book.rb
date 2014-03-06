class LessonBook < ActiveRecord::Base
  belongs_to :book
  belongs_to :lesson
end
