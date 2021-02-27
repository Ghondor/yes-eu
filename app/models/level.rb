class Level < ApplicationRecord
  belongs_to :exam
  belongs_to :teacher, class_name: 'User'
  has_many :questions
  accepts_nested_attributes_for :questions, allow_destroy: true, reject_if: :all_blank
end
