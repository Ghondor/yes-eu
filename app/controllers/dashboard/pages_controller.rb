module Dashboard
  class PagesController < Dashboard::DashboardController
    def home
      @students = User.all.where(student_role: true).count
      @classrooms = Room.all.where(school_id: current_user.school.id).count
    end
  end
end
