class Level < ApplicationRecord
  before_validation :assign_level_title
  belongs_to :exam
  belongs_to :teacher, class_name: 'User'
  has_many :questions
  accepts_nested_attributes_for :questions, allow_destroy: true, reject_if: :all_blank

  def can_create_level?(school_id, exam_id)
    School.find(school_id).exams.find(exam_id).levels.count < 9
  end

  def assign_level_title
    self.title = "Level #{Level.all.count + 1}"
  end
end
