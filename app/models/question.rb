class Question < ApplicationRecord
  belongs_to :level
  validates_presence_of :question_title, :first_answer, :second_answer, :third_answer, :points
end
