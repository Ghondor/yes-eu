class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :registerable

  has_many :rooms, foreign_key: 'head_teacher_id', inverse_of: :head_teacher
  has_many :exams, foreign_key: 'teacher_id', inverse_of: :teacher
  has_many :levels, foreign_key: 'teacher_id', inverse_of: :teacher
  has_many :results, foreign_key: 'student_id', inverse_of: :student
  belongs_to :room, optional: true
  belongs_to :school
end
