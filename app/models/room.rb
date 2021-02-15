class Room < ApplicationRecord
  belongs_to :head_teacher, class_name: 'User'
  has_many :students, class_name: 'User'
  # has_many :students, foreign_key: 'student_id', inverse_of: :student
end
