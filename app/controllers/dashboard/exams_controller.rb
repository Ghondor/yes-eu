module Dashboard
  class ExamsController < Dashboard::DashboardController
    before_action :set_exam, only: %i[show]
    def index
      @exams = current_user.school.exams.includes(%i[teacher])
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
