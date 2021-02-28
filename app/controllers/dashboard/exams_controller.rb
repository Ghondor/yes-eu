module Dashboard
  class ExamsController < Dashboard::DashboardController
    before_action :set_exam, only: %i[show]

    def index
      @exams = current_user.student_role? ? current_user.school.exams - current_user.school.exams.joins(:results).where(results: {student_id: current_user.id, taken: true})
                   : current_user.school.exams.includes(%i[teacher])
    end

    def show
      @levels = @exam.levels
    end

    private

    def set_exam
      @exam = Exam.find(params[:id])
    end
  end
end
