module Dashboard
  class PagesController < Dashboard::DashboardController
    before_action :current_user_is_student?

    def home
      @students = User.all.where(student_role: true).count
      # @classrooms = Room.all.where(school_id: current_user.school.id).count
    end

    private

    def current_user_is_student?
      if current_user.student_role?
        redirect_to dashboard_exams_path
      end
    end
  end
end
