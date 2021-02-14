class Room < ApplicationRecord
  belongs_to :head_teacher, class_name: 'User'
end
