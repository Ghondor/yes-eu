module Dashboard
  class ResultsController < Dashboard::DashboardController
    def new
      @result = Result.new
      @exam = Exam.find_by(id: params[:exam], school_id: current_user.school_id)
      @questions = @exam.level.questions
    end

    def create
      @result = Result.new(result_params)
      @result.student = current_user
    end

    private

    def result_params
      params.require(:result).permit(%i[grade exam_id])
    end
  end
end
