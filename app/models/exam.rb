class Exam < ApplicationRecord
  belongs_to :teacher, class_name: 'User'
  has_many :levels
  has_many :results
end
