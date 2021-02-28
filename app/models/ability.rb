# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.superadmin_role?
      can :manage, :all
    end
    if user.teacher_role?
      can :manage, Exam
      can :manage, Level
      can :manage, Question
    end
    if user.student_role?
      can :read, Result
    end
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
