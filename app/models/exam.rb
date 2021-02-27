class Exam < ApplicationRecord
  before_validation :assign_title
  belongs_to :teacher, class_name: 'User'
  belongs_to :school
  has_one :level
  has_many :results

  validates_presence_of :title

  def numbers_of_exams
    Exam.all.count
  end

  def can_create_exam?(school_id)
    School.find(school_id).exams.count < 9
  end

  private

  def assign_title
    self.title = "Exam #{numbers_of_exams + 1}"
  end
end
