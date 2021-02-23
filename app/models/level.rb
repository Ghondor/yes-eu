class Level < ApplicationRecord
  belongs_to :exam
  belongs_to :teacher, class_name: 'User'
  has_many :questions
end
